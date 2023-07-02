import duckdb
import glob

conn = duckdb.connect('duckdb_data')

csv_directory = 's3data/data/*.csv'

for csv_file in glob.glob(csv_directory):
    data = conn.execute(f"SELECT * FROM read_csv_auto('{csv_file}')").fetchdf()
    if conn.execute("SELECT 1 FROM pragma_table_info('my_table') LIMIT 1").fetchone() is None:
        conn.register('my_table', data)
    else:
        conn.execute("INSERT INTO my_table SELECT * FROM read_csv_auto(?)", (csv_file,))

