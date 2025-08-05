/* MONIORAMENTO GERAL DOS INDICADORES DE MEMÓRIA RAM */

-- Memória usada pelos processos do SQL Server
SELECT
    GETDATE() AS DataHora,
    (physical_memory_in_use_kb/1024) AS MemoryUsed_MB,
    (locked_page_allocations_kb/1024) AS LockedPages_MB,
    (total_virtual_address_space_kb/1024) AS VirtualMemory_MB,
    process_physical_memory_low,
    process_virtual_memory_low
FROM sys.dm_os_process_memory;


-- Total de memória usada e disponível do SO
SELECT 
    total_physical_memory_kb / 1024 AS TotalPhysicalMemory_MB,
    available_physical_memory_kb / 1024 AS AvailablePhysicalMemory_MB,
    system_memory_state_desc AS EstadoMemoriaSO
FROM sys.dm_os_sys_memory;


-- Uso de memória por componentes internos do SQL
SELECT 
    type AS ComponenteInterno,
    SUM(pages_kb)/1024 AS Memoria_MB
FROM sys.dm_os_memory_clerks
GROUP BY type
ORDER BY SUM(pages_kb) DESC;


-- Buffers de dados atualmente em cache
SELECT 
    COUNT(*) * 8 / 1024 AS BufferPool_DataCache_MB
FROM sys.dm_os_buffer_descriptors
WHERE database_id NOT IN (1,2,3,4) -- ignora tempdb, master, etc.


-- Quantidade de memória consumida somando todas as sessões ativas
SELECT 
    COUNT(*) AS TotalSessoesAtivas,
    SUM(memory_usage * 8) AS MemoriaTotal_KB,
    SUM(memory_usage * 8) / 1024.0 AS MemoriaTotal_MB
FROM sys.dm_exec_sessions
WHERE is_user_process = 1;


-- Quantidade memória consumida individualmente por sessão ativa
SELECT 
    s.session_id,
    s.login_name,
    s.status,
    s.host_name,
    s.program_name,
    r.status AS request_status,
    r.command,
    r.cpu_time,
    r.total_elapsed_time,
    s.memory_usage * 8 AS Memoria_KB, -- Aproximadamente a memória usada pela sessão
    s.memory_usage * 8 / 1024.0 AS Memoria_MB
FROM sys.dm_exec_sessions s
LEFT JOIN sys.dm_exec_requests r ON s.session_id = r.session_id
WHERE s.is_user_process = 1
ORDER BY Memoria_MB DESC;


-- Consultas mais pesadas em memória (últimos minutos)
SELECT TOP 5
    qs.total_logical_reads AS LeituraLogicaTotal,
    qs.total_worker_time / 1000 AS TempoCPU_ms,
    qs.execution_count AS Execucoes,
    qs.total_elapsed_time / 1000 AS TempoTotal_ms,
    st.text AS QueryTexto
FROM sys.dm_exec_query_stats qs
CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) st
ORDER BY qs.total_logical_reads DESC;

