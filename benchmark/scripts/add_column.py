import pandas as pd
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('--filename')
parser.add_argument('--colname', 
                    help="Name of the new column")
parser.add_argument('--colval', 
                    type=int)



args = parser.parse_args()

colval = args.colval
filename = args.filename
column_name = args.colname

df = pd.read_csv(filename)

if not column_name in df.columns:
    df[column_name] = colval

df.to_csv(filename, index=False)

