# Converts categorical data into numerical
import pandas as pd

df = pd.read_csv()
df2 = df.apply(lambda x: pd.factorize(x)[0])
df2.to_csv("data.csv")
