# Provides a VPC resource.
# This comment briefly introduces the code's purpose – creating and configuring AWS VPC and subnets.

# Start with the Provider
provider "aws" {
  region                   = "us-east-1"  # Specifies the AWS region where resources will be created (us-east-1, in this case).
}

# Define a variable for the VPC
variable "vpc_cidr" {
  type        = string  # Specifies that the variable will be of string type.
  description = "Public Subnet CIDR values"  # Description of what this variable represents.
  default     = "10.0.0.0/16"  # Default CIDR block for the VPC. It sets the IP range for the entire VPC.
}

# Create AWS VPC in us-east-1 with CIDR - 10.0.0.0/16
resource "aws_vpc" "vpc-nwauche-us-east-1" {
  cidr_block = var.vpc_cidr  # Uses the value of the 'vpc_cidr' variable to define the CIDR block for the VPC.
  tags = {
    Name = "nwaucheVPC-us-east-1"  # Assigns a tag to the VPC for identification, using the name "nwaucheVPC-us-east-1".
  }
}

# Set Up Subnets
# Define Variables

# Public Subnet CIDR values for two subnets.
variable "cidr_public_subnet" {
  type        = list(string)  # Specifies that the variable is a list of strings.
  description = "Public Subnet CIDR values"  # Describes the purpose of the variable.
  default     = ["10.0.1.0/24", "10.0.2.0/24"]  # Default CIDR blocks for two public subnets.
}

# Private Subnet CIDR values for two subnets.
variable "cidr_private_subnet" {
  type        = list(string)  # Specifies that the variable is a list of strings.
  description = "Private Subnet CIDR values"  # Describes the purpose of the variable.
  default     = ["10.0.3.0/24", "10.0.4.0/24"]  # Default CIDR blocks for two private subnets.
}

# Availability Zones for the subnets
variable "us_availability_zone" {
  type        = list(string)  # Specifies that the variable is a list of strings.
  description = "Availability Zones"  # Describes the purpose of the variable.
  default     = ["us-east-1a", "us-east-1b"]  # Defines two availability zones for the subnets.
}

# Setup public subnet
resource "aws_subnet" "aws_nwauche_public_subnets" {
  count      = length(var.cidr_public_subnet)  # The number of public subnets to create based on the number of CIDR blocks in the variable.
  vpc_id     = aws_vpc.vpc-nwauche-us-east-1.id  # Reference the VPC ID from the earlier-created VPC resource.
  cidr_block = element(var.cidr_public_subnet, count.index)  # Assigns a CIDR block for each public subnet based on the index of the 'cidr_public_subnet' list.
  availability_zone = element(var.us_availability_zone, count.index)  # Assigns an availability zone for each subnet, based on the index of the 'us_availability_zone' list.

  tags = {
    Name = "nwauche-public-${count.index + 1}"  # Names each public subnet based on its index (e.g., "nwauche-public-1", "nwauche-public-2").
  }
}

# Setup private subnet
resource "aws_subnet" "aws_nwauche_private_subnets" {
  count      = length(var.cidr_private_subnet)  # The number of private subnets to create based on the number of CIDR blocks in the variable.
  vpc_id     = aws_vpc.vpc-nwauche-us-east-1.id  # Reference the VPC ID from the earlier-created VPC resource.
  cidr_block = element(var.cidr_private_subnet, count.index)  # Assigns a CIDR block for each private subnet based on the index of the 'cidr_private_subnet' list.
  availability_zone = element(var.us_availability_zone, count.index)  # Assigns an availability zone for each subnet, based on the index of the 'us_availability_zone' list.

  tags = {
    Name = "nwauche-private-${count.index + 1}"  # Names each private subnet based on its index (e.g., "nwauche-private-1", "nwauche-private-2").
  }
}
