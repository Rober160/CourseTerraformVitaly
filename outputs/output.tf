output "ec2_public_ip" {
  description = "IP publica instacia"
  value = aws_instance.instancia_ec2.public_ip
}
