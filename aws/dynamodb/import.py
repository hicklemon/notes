import boto3
import json

client = boto3.resource('client', region_name='us-east-1')
table = client.Table('some-Table-Name-Here')
items = json.load(open('some-data.json'))

with table.batch_writer() as batch:
    for item in items:
        batch.put_item(item)

