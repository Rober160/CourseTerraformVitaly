resource "aws_vpc" "vpc_virginia" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Owner = "Roberto"
    Name = "VPC_VIRGINIA"
    Environment = "DevOps"
  }
}

resource "aws_vpc" "vpc_ohio" {
  cidr_block = "10.20.0.0/16"
  tags = {
    Owner = "Roberto"
    Name = "VPC_OHIO"
    Environment = "DevOps"
  }

  provider = aws.ohio
}
