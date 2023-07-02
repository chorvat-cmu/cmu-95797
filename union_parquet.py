import duckdb
import glob

def union_parquet_files(prefix, table_name):
    con = duckdb.connect(database=':memory:')
    con.execute(f'CREATE TABLE {table_name} AS SELECT * FROM (VALUES (NULL));')

    parquet_files = glob.glob(f'{prefix}*.parquet')
    for file in parquet_files:
        con.execute(f'INSERT INTO {table_name} SELECT * FROM parquet_scan(\'{file}\')')

    result = con.execute(f'SELECT * FROM {table_name}')
    for row in result:
        print(row)