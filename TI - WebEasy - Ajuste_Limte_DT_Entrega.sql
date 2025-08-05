

select 
	QtDiasLimiteDtEntregaPedido, 
	QtDiasLimiteCriacaoPedido, 
* from weasy.usuario
where QtDiasLimiteDtEntregaPedido is not null


UPDATE weasy.usuario
SET QtDiasLimiteDtEntregaPedido='10'
where QtDiasLimiteDtEntregaPedido is not null