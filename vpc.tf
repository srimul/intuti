# Specify the provider and access details

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}

variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.192.0.0/16"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.192.20.0/24"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
    default = "10.192.31.0/24"
}

provider "aws" {
  region = "${var.aws_region}"
}

// Create a VPC to launch our instances into

resource "aws_vpc" "Intuit" {
  cidr_block = "10.192.0.0/16"
  enable_dns_hostnames = true
}


// Create a Public subnet to launch our instances into

resource "aws_subnet" "public" {
  vpc_id = "${aws_vpc.Intuit.id}"
  cidr_block = "${var.public_subnet_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "us-east-2a"
}

// Create a Private subnet to launch our instances into

resource "aws_subnet" "private" {
  vpc_id = "${aws_vpc.Intuit.id}"
  cidr_block = "${var.private_subnet_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "us-east-2a"
 }


// Create an internet gateway to give our subnet access to the outside world

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.Intuit.id}"
}

// Create a Route Table 

resource "aws_route_table" "myrt" {
    vpc_id = "${aws_vpc.Intuit.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
}

// Associate Route Table with Public subnet

resource "aws_route_table_association" "rt-public" {
    subnet_id = "${aws_subnet.public.id}"
    route_table_id = "${aws_route_table.myrt.id}"
}
