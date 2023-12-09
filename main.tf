# Create a VPC
resource "aws_vpc" "vpc_main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_main"
  }
}

#create web subnet1
resource "aws_subnet" "web_subnet1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.8.0/21"

  tags = {
    Name = "web_subnet1"
  }
}


#create web subnet2
resource "aws_subnet" "web_subnet2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.16.0/21"

  tags = {
    Name = "web_subnet2"
  }
}


#create app subnet1
resource "aws_subnet" "app_subnet1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.24.0/21"

  tags = {
    Name = "app_subnet1"
  }
}

#create app subnet2
resource "aws_subnet" "app_subnet2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.32.0/21"

  tags = {
    Name = "app_subnet2"
  }
}

#create db subnet1
resource "aws_subnet" "db_subnet1" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.40.0/21"

  tags = {
    Name = "db_subnet1"
  }
}

#create db subnet2
resource "aws_subnet" "db_subnet2" {
  vpc_id     = aws_vpc.vpc_main.id
  cidr_block = "10.0.48.0/21"

  tags = {
    Name = "db_subnet2"
  }
}


