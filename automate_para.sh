#!/usr/local/bin/bash -xe
declare -A vars

vars[env]=develop
vars[debug]=true
vars[key]="key_value"
#(more vars listed here...)

for i in "${!vars[@]}"
do
  aws ssm put-parameter \
  --profile "aws-main" \
  --name "dev_${i}" \
  --type "SecureString" \
  --value "${vars[$i]}" \
  --key-id "alias/dev-kms-key" \
  --tags Key=Environment,Value=Develop Key=Product,Value=Example \
  --region "us-west-2"
done
