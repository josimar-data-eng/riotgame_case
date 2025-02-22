import sqlite3
import pandas as pd


def get_connection(db_name):
    conn = sqlite3.connect(db_name)
    return conn


def create_table(input_file, conn, table_name):
    df = pd.read_csv(input_file)
    df.to_sql(table_name, conn, if_exists="replace", index=False)
    return
