import pandas as pd
from db.setup import get_connection


def execute_sql_script(conn, sql_script, db_name):
    conn = get_connection(db_name)

    with open(f"{sql_script}", "r") as file:
        query = file.read()

    return pd.read_sql(query, conn)
