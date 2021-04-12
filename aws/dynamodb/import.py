import boto3
import json

client = boto3.resource('dynamodb', region_name='us-east-1')
table = client.Table('some-Table-Name-Here')
items = json.load(open('some-data.json'))

with table.batch_writer() as batch:
    for item in items:
        batch.put_item(item)

## ALTERNATIVE

"""
    Usage: ./script.py table-name filename.json
"""

import boto3
import json
import sys

client = boto3.resource('dynamodb', region_name='us-east-1')
table = client.Table(sys.argv[1])
items = json.load(open(sys.argv[2]))

with table.batch_writer() as batch:
    for item in items:
        batch.put_item(item)
