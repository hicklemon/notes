import boto3
import json

dynamodb = boto3.resource('dynamodb', region_name='us-east-1')

table = dynamodb.Table('someTable')

items = json.load(open('file1.json'))

with table.batch_writer() as batch:
    for item in items:
        batch.put_item(item)

items = json.load(open('file2.json'))

with table.batch_writer() as batch:
    for item in items:
        batch.put_item(item)

