import pandas as pd
import requests

# House Stock Watcher
url = "https://house-stock-watcher-data.s3-us-west-2.amazonaws.com/data/all_transactions.json"

#get url
response = requests.get(url)
response.status_code

json_resp = response.json()
df = pd.DataFrame(json_resp)

#check data
df.info()
df.head(10)

#shape attribute
df.shape

#select columns
house_stock_watcher = df[['disclosure_year', 'type', 'amount','owner']]
house_stock_watcher.head()

#missing vaues
df.isna().sum().sum()

#filter rows 
house_stock = df.query("disclosure_year == 2021")[['disclosure_year', 'type', 'amount', 'owner']]
house_stock.head()

#filter mulitple conditions
df['amount'].value_counts()

#groupby + aggregate
result = df.groupby(['district'])[['district','disclosure_year', 'type', 'amount', 'owner',]]\
    .agg(['max', 'mean','sum'])\
    .reset_index()
result.head()
result.tail()


#export file csv
result.to_csv("homework/homework_sprint11_api.csv")








