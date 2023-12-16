# This will create EIP
resource "aws_eip" "eip" {
   domain = vpc
}


# This will associate the EIP
resource "aws_eip_association" "eip_assoc" {
  allocation_id = aws_nat_gateway.nat_gateway.allocation_id
  network_interface_id = aws_nat_gateway.nat_gateway.network_interface_id
}



# This will create a nat gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.web_subnet1.id

  tags = {
    Name = "gw NAT"
  }
}
  
#This will create a route table for the NAT.
resource "aws_route" "nat_gateway" {
  route_table_id         = aws_route_table.example.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.example.id
}