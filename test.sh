#!/bin/bash

NO_AUTH_URL=$(aws cloudformation describe-stacks --stack-name sam-app | jq -r '.Stacks[0].Outputs[] | select(.OutputKey|match("LambdaFurlNoAuthFunctionEndpoint")) | .OutputValue')
IAM_AUTH_URL=$(aws cloudformation describe-stacks --stack-name sam-app | jq -r '.Stacks[0].Outputs[] | select(.OutputKey|match("LambdaFurlIAMFunctionEndpoint")) | .OutputValue')

echo -e "Calling Lambda Function URL with no auth - This should return 200 with body: \n"
curl $NO_AUTH_URL -X GET

echo -e "\n\nCalling Lambda Function URL with IAM auth - This should return a forbidden message: \n"
curl $IAM_AUTH_URL -X GET

echo -e "\n\nCalling Lambda Function URL with IAM auth using SigV4 - this should return 200 with body: \n"
awscurl -X GET --service lambda --region us-east-1 $IAM_AUTH_URL
