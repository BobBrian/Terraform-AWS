Terraform AWS VPC and Subnet Setup
This repository contains Terraform code to provision an AWS Virtual Private Cloud (VPC) along with public and private subnets. The resources are created in the us-east-1 AWS region.

Prerequisites
Terraform installed (v1.0.0 or higher)
AWS account with necessary permissions to create VPC, subnets, and other AWS resources.
AWS CLI configured with credentials or use IAM roles if running from EC2.
Resources Created
VPC: A VPC in the us-east-1 region with a CIDR block of 10.0.0.0/16.
Public Subnets: Two public subnets in the specified availability zones (us-east-1a and us-east-1b).
Private Subnets: Two private subnets in the specified availability zones.
Terraform Provider
This code uses the AWS provider to interact with AWS resources. The region is set to us-east-1 by default, but this can be modified in the provider block.

How to Use
Clone the repository:

bash
Copy code
git clone https://github.com/your-repo/aws-vpc-subnet-terraform.git
cd aws-vpc-subnet-terraform
Set up your AWS credentials (if not already configured):

You can configure the AWS CLI with your credentials by running:

bash
Copy code
aws configure
Alternatively, set the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables.

Initialize Terraform:

Run the following command to initialize Terraform and download necessary plugins:

bash
Copy code
terraform init
Review the plan:

Run the following command to see what Terraform will create:

bash
Copy code
terraform plan
Apply the changes:

Run the following command to create the resources:

bash
Copy code
terraform apply
Confirm the prompt by typing yes to proceed with the creation of the resources.

Check AWS Console:

After the Terraform apply finishes, you can check the AWS Console in the us-east-1 region to see the created VPC, subnets, and associated tags.

Destroy the Resources (if needed):

To clean up and destroy the created resources, run:

bash
Copy code
terraform destroy
Confirm the prompt by typing yes to delete the resources.

Configuration
The following variables can be adjusted in the variables.tf file:

vpc_cidr: The CIDR block for the VPC. Default is 10.0.0.0/16.
cidr_public_subnet: List of CIDR blocks for the public subnets. Default is ["10.0.1.0/24", "10.0.2.0/24"].
cidr_private_subnet: List of CIDR blocks for the private subnets. Default is ["10.0.3.0/24", "10.0.4.0/24"].
us_availability_zone: List of availability zones for subnet creation. Default is ["us-east-1a", "us-east-1b"].
Outputs
No outputs are defined for this configuration, but you can add outputs for VPC ID, subnet IDs, and other relevant information if needed.

License
This code is open source and available under the MIT License.
