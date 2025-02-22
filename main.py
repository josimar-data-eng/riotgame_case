import os
import sqlite3
import pandas as pd
from db.setup import get_connection, create_table
from db.execute import execute_sql_script


# variables
results = {}
db_name = "database.db"
input_file = "data/val_round_details_sample.csv"
sql_scripts_path = "sql_scripts"
sql_files = sorted([f for f in os.listdir(sql_scripts_path) if f.endswith(".sql")])

# get connection
conn = get_connection(db_name)

# create table
table_name = input_file.split("/")[-1].split(".")[0]
create_table(input_file, conn, table_name)

# execute sql
for i, (sql_file) in enumerate(sql_files, start=1):
    results[f"{sql_file}"] = execute_sql_script(
        conn, f"{sql_scripts_path}/{sql_file}", db_name
    )

# print sql result
for i in results:
    print("====================", i, "====================")
    print(results[i], "\n\n")


# close connection
conn.close()
