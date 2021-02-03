#!/usr/bin/env bash

for profile in {default,prod,qa,dev,sandbox}
do
    echo -e "ENV: ${profile}"
    for region in $(aws ec2 describe-regions | jq '.Regions[].RegionName' -r)
    do
        echo -e "REGION: ${region}"
        aws --profile ${profile} --region ${region} ec2 describe-volumes --filters "Name=status,Values=in-use" | jq '.Volumes[] | { name:(.Tags[]? | select(.Key=="Name") | .Value) }, .Attachments[].InstanceId, .Attachments[].VolumeId, .AvailabilityZone, .Encrypted, .Size, .VolumeType, .State, .CreateTime' -r
    done
done

