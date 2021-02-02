#!/usr/bin/env bash

for profile in {default,prod,qa,dev,sandbox}
do
    echo -e "ENV: ${profile}"
    for region in {ap-northeast-1,ap-northeast-2,ap-south-1,ap-southeast-1,ap-southeast-2,ca-central-1,eu-central-1,eu-west-1,eu-west-2,sa-east-1,us-east-1,us-east-2,us-west-1,us-west-2}
    do
        echo -e "REGION: ${region}"
        aws --profile ${profile} --region ${region} ec2 describe-volumes --filters "Name=status,Values=available" | awk -F: '/(VolumeType|VolumeId|State|CreateTime|Size)/ {print $1 ": " $2}' | awk ' {print;} NR % 5 == 0 { print "            --------------------------------"; }'
    done
done
