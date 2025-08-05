USE [ALTERDATA_ERP]
GO

CREATE TRIGGER TR_PRAZOS_USUARIOS_EMP30 -- TRIGGER PARA AO CADASTRAR UM NOVO USU�RIO NA EMPRESA 30 COM PERFIL DE VENDAS, ADICIONAR OS PRAZOS DE PAGAMENTO DO GRUPO DE PRAZO BIOT� RA��ES --
ON dbo.Usuario_PerfilUsuario
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Aguardar at� que os dados estejam prontos (solu��o para problemas de ordem de inser��o)
    WAITFOR DELAY '00:00:03';  -- Pequeno atraso para garantir que as inser��es associadas foram conclu�das

    INSERT INTO dbo.UsuarioPrazo (IdUsuario, IdPrazo)
    SELECT i.IdUsuario, p.IdPrazo
    FROM inserted i
    INNER JOIN dbo.Usuario_Empresa ue ON ue.IdUsuario = i.IdUsuario
    INNER JOIN dbo.Usuario_PerfilUsuario up ON up.IdUsuario = i.IdUsuario
    INNER JOIN dbo.Prazo p ON p.IdGrupoPrazo = '00A0000008'
    WHERE ue.CdEmpresa = '30'
    AND up.IdPerfilUsuario = '00A000000C';

END;