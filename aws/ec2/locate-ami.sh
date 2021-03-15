#!/usr/bin/env bash

if [[ $1 != *"ami-"* ]]
then
    echo "Give me an AMI ID."
    exit 1
fi

for profile in {default,prod,qa,dev,sandbox}
do
    echo -e "ENV: ${profile}"
    aws --profile ${profile} ec2 describe-images --image-ids $1 | awk -F: '/(ImageId|CreationDate|ImageLocation|SriovNetSupport)/ {print $1 ": " $2}' | awk ' {print;} NR % 4 == 0 { print "            --------------------------------"; }'
done
