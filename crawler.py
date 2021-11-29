import json
import boto3
import os
import logging

glue_client = boto3.client('glue')
crawler_name = os.environ['crawler_name'] 

def trigger(event, context):
    
    try:
        glue_client.start_crawler(
        Name= crawler_name
        )
    except Exception as e:
        if e.response['Error']['Code'] == 'EntityNotFoundException':
            print(f'Crawler {crawler_name} was not found, plase recheck the crawler name')