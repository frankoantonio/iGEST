

SELECT 
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default,
    pg_catalog.col_description('auditoria'::regclass, ordinal_position) AS comment
FROM information_schema.columns
WHERE table_name = 'auditoria';

SELECT pg_get_tabledef('auditoria'::regclass);