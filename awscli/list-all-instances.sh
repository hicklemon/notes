#!/usr/bin/env bash

for profile in {default,prod,qa,dev,sandbox}
do
    echo -e "ENV: ${profile}"
    for region in us-west-2
    do
        echo -e "REGION: ${region}"
        aws --profile ${profile} --region ${region} ec2 describe-instances --output table
    done
done
