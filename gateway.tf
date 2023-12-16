# this will create IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_main.id

  tags = {
    Name = "IGW"
  }
}


# This will create the IGW VPC Attachment
resource "aws_internet_gateway_attachment" "igw_attachment" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.vpc_main.id
}




# This is a route table for public subnets.
resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.vpc_main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Public Route Table"
  }
}


# This is a route table for private subnets.
resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.vpc_main.id
  tags = {
    Name = "private_rtb"
  }
}

# this is a route table association for public subnet1
resource "aws_route_table_association" "web_public_a_Rt_ass" {
  subnet_id      = aws_subnet.web_subnet1.id
  route_table_id = aws_route_table.public-rtb.id
}

# this is a route table association for public subnet2
resource "aws_route_table_association" "web_public_b_Rt_ass" {
  subnet_id      = aws_subnet.web_subnet2.id
  route_table_id = aws_route_table.public-rtb.id
}


# this is a route table association for private subnet1
resource "aws_route_table_association" "app_private_a_Rt_ass" {
  subnet_id      = aws_subnet.app_subnet1.id
  route_table_id = aws_route_table.private_rtb.id
}

# this is a route table association for private subnet2
resource "aws_route_table_association" "app_private_b_Rt_ass" {
  subnet_id      = aws_subnet.app_subnet2.id
  route_table_id = aws_route_table.private_rtb.id
}









