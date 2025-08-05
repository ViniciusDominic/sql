USE [ALTERDATA_ERP]
GO

ALTER TRIGGER TR_USUARIO_PRAZO -- TRIGGER PARA AO CADASTRAR UM NOVO PRAZO DE PAGAMENTO, ESTE PRAZO SEJA INSERIDO NOS USU�RIOS DA WMP AUTOM�TICAMENTE --
ON dbo.Prazo
AFTER INSERT
AS
BEGIN
    -- Declarar vari�veis
    DECLARE @IdPrazo CHAR(10);
	DECLARE @IdGrupoPrazo CHAR(10);

  -- Obter o IdPrazo e IdGrupoPrazo do novo registro inserido na tabela dbo.Prazo
    SELECT @IdPrazo = IdPrazo, @IdGrupoPrazo = IdGrupoPrazo
    FROM inserted;

    -- Verificar se o IdGrupoPrazo � igual a '00A0000008'
    IF @IdGrupoPrazo = '00A0000008'
    BEGIN
        -- Inserir na tabela dbo.UsuarioPrazo para os IdUsuarios informados
        INSERT INTO dbo.UsuarioPrazo (IdUsuario, IdPrazo)
        SELECT IdUsuario, @IdPrazo
        FROM dbo.Usuario
        WHERE IdUsuario IN ('00A0000084','00A0000085','00A0000086','00A0000087','00A000009Y')
        AND NOT EXISTS (
            -- Verifica se o IdPrazo j� est� vinculado a esse usu�rio
            SELECT 1
            FROM dbo.UsuarioPrazo up
            WHERE up.IdPrazo = @IdPrazo
            AND up.IdUsuario = dbo.Usuario.IdUsuario
        );
    END
    ELSE
    BEGIN
        -- Caso o IdGrupoPrazo n�o seja '00A0000008', n�o faz nada ou loga a situa��o
        PRINT 'IdGrupoPrazo n�o � igual a "00A0000008", o gatilho n�o ser� executado.';
    END
END;