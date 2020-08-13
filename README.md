# Infrastructure
  **Security infrastructure built to support TheOnly-Co.** 

## CircleCi

[![CircleCI](https://circleci.com/gh/hunkeelin/infrastructure.svg?style=shield)](https://circleci.com/gh/hunkeelin/infrastructure)
 - Configure `config.yml` to allow asynchronous updates with github
 - Staging commands to plan/apply jobs to the master branch

## AWS
 - Virtual Private Cloud
   - Setup VPC routing between accounts and vendors with transit gateways
   - Provision components with terraform
   - Scale across the infrastructure to allow high availability
 - Elastic Kubernetes Service (EKS)
   - Setup RBAC to allow specific user accessibility 
   - [Authenticate with Okta and kube2iam assume-role](https://github.com/TheOnly-Co/oktaasume)
   - Couple CICD with helm to deploy microservices 
   - Logging and monitoring with elaticsearch
   - Deploy container services and work with Docker images     
 - [AWS amazon linux 2](https://aws.amazon.com/amazon-linux-2/)
   - Working with ami

## Okta

 - Implement AWS roles and permissions with Okta SAML authentication
 - Enforce MFA Okta push notification on users
 - Tie Okta users login to IAM role based access
