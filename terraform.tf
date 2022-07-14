provider "aws" {
    access_key = ""
    secret_key = ""
    endpoints {
sts = "https://sts.us-west-1.amazonaws.com/"
}
    region = "us-west-1"
}

# creating VPC,name,CIDR and Tags
resource "aws_vpc" "dev" {
    cidr_block          = "10.0.0.0/16"
    instance_tenancy    = "default"
    tags = {
        Name = "dev"
    }
}


#Creating Public Subnet in vpc
resource "aws_subnet" "dev-public-1" {
    vpc_id                = aws_vpc.dev.id
    cidr_block            = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone     = "us-west-1c"

    tags = {
        Name = "dev-public-1"
    }
}


resource "aws_subnet" "dev-public-2" {
    vpc_id                = aws_vpc.dev.id
    cidr_block            = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone     = "us-west-1c"

    tags = {
        Name = "dev-public-2"
    }
}


#cretaing private subnet in vpc
resource "aws_subnet" "dev-private-1" {
    vpc_id                = aws_vpc.dev.id
    cidr_block            = "10.0.3.0/24"
    map_public_ip_on_launch = "false"
    availability_zone     = "us-west-1c"

    tags = {
        Name = "dev-private-1"
    }
}

# creating Internet Gateway in AWS VPC
resource "aws_internet_gateway" "dev-gw" {
    vpc_id = aws_vpc.dev.id

    tags = {
        Name = "dev"
    }
}


# creating Route Tables for internet gateway
resource "aws_route_table" "dev-public" {
    vpc_id = aws_vpc.dev.id
    route {  
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev-gw.id
    }

    tags = {
        Name = "dev-public-1" 
    } 
    }


# Creating Route Associations public subnets
resource "aws_route_table_association" "dev-public-1-a" {
  subnet_id      = aws_subnet.dev-public-1.id
  route_table_id = aws_route_table.dev-public.id
}


# Creating  ec2 instance 
resource "aws_instance" "qw" {
    ami           = "ami-02541b8af977f6cdd"
    instance_type = "t2.micro"
    tags = {

    Name = "linux-machine"
  }
}
