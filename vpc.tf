# step - 1 : Create VPC 
resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "my-vpc"
  }

}

# step - 2 : Create Internet Gateway

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my-igw"
  }
}

# step - 3 : Create Subnet

resource "aws_subnet" "my_subnet-1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.subnet_1_cidr_block

  availability_zone = var.availability_zone_1
  tags = {
    Name = "my-subnet"
  }
}

# step - 4 : Create Route Table
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my-route-table"
  }
}

# ---- step - 5 : Create Route
resource "aws_route" "my_route" {
  route_table_id         = aws_route_table.my_route_table.id
  destination_cidr_block = var.route_cidr
  gateway_id             = aws_internet_gateway.my_igw.id

}

# step - 6 : Associate Route Table with Subnet
resource "aws_route_table_association" "subnet-1-association" {
  subnet_id      = aws_subnet.my_subnet-1.id
  route_table_id = aws_route_table.my_route_table.id
}


# step - 7 : Create Security Group
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH access"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Jenkins web UI access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All outbound traffic"
  }

  tags = {
    Name = "my-security-group"
  }






}