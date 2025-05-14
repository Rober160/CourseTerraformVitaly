resource "aws_instance" "instancia_ec2" {
  ami           = "ami-085386e29e44dacd7"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]

  tags = {
    Name = "Ec2_Terraform"
  }

}
