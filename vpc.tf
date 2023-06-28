# vpc
resource "aws_vpc" "big-vpc" {

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "big-vpc"
  }

}

# public subnet -A
resource "aws_subnet" "big-pub-sn-A" {
  vpc_id     = aws_vpc.big-vpc.id
  cidr_block = "10.0.0.0/20"
 availability_zone ="ap-south-1a"
 map_public_ip_on_launch = "true"
  tags = {
    Name = "big-pub-sn-A"
  }
}



# public subnet -B

resource "aws_subnet" "big-pub-sn-B" {
  vpc_id     = aws_vpc.big-vpc.id
  cidr_block = "10.0.16.0/20"
 availability_zone ="ap-south-1b"
 map_public_ip_on_launch = "true"
  tags = {
    Name = "big-pub-sn-B"
  }
}

# private subnet -A
resource "aws_subnet" "big-pvt-sn-A" {
  vpc_id     = aws_vpc.big-vpc.id
  cidr_block = "10.0.32.0/20"
 availability_zone ="ap-south-1a"
 map_public_ip_on_launch = "false"
  tags = {
    Name = "big-pvt-sn-A"
  }
}


# private subnet -B
resource "aws_subnet" "big-pvt-sn-B" {
  vpc_id     = aws_vpc.big-vpc.id
  cidr_block = "10.0.48.0/20"
 availability_zone ="ap-south-1b"
 map_public_ip_on_launch = "false"
  tags = {
    Name = "big-pvt-sn-B"
  }
}

# internet gateway
resource "aws_internet_gateway" "big-vpc-igw" {
  vpc_id = aws_vpc.big-vpc.id

  tags = {
    Name = "big-vpc-igw"
  }
}

# public route table
resource "aws_route_table" "big-pub-vpc-rt" {
  vpc_id = aws_vpc.big-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.big-vpc-igw.id
  }
  tags = {
    Name = "big-pub-rt"
  }
}

# private route table
resource "aws_route_table" "big-pvt-vpc-rt" {
  vpc_id = aws_vpc.big-vpc.id

  tags = {
    Name = "big-pvt-rt"

}
}