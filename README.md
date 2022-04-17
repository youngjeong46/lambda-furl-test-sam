# Lambda Function URL Sample SAM Application

This is a sample AWS SAM application to demonstrate the use of Lambda Function URL. Fork it and test it out.

## Prerequisites:

1. Installations: [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html), [AWS SAM](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install.html)
2. Set the aws profile using AWS CLI.
3. You will need to set the following secerts on your forked repo:
   - AWS_ACCESS_KEY_ID: AWS Access Key ID
   - AWS_SECRET_ACCESS_KEY: Corresponding Secret Access Key 
4. You need [awscurl](https://github.com/okigan/awscurl) installed if you want to test using the provided script.


## Instructions:

1. Fork the repo. 
2. Set the secrets as displayed above.
3. Clone to local.
4. `sam build` to build a SAM template.
5. `sam pipeline bootstrap` to bootstrap the pipeline.
6. `sam pipeline init` to initialize the pipeline. You will need your forked repo url.

## Testing:

Run `./test.sh` to run the scripts. It does the following:

- curls the Function URL with NO AUTH, resulting in a successful response, 
- curls the Function URL with IAM AUTH, resulting in a forbidden response, and
- curls the Function URL with IAM AUTH using Sigv4 (`awscurl`), resulting in a successful response. 