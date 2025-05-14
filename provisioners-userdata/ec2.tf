resource "aws_instance" "instancia_ec2" {
  ami           = var.ec2_specs.ami
  instance_type = var.ec2_specs.instance_type
  subnet_id     = aws_subnet.public_subnet.id
  key_name      = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  //user_data lo ejecuta root
  user_data = file("C:/Users/r.negretega_vitaly/Desktop/Practicas_Terraform/practica_7/userdata.sh")


  provisioner "local-exec" {
    command = "echo instancia creada con IP ${aws_instance.instancia_ec2.public_ip} >> datos_instancia.txt"
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo Instancia ${self.public_ip} destruida >> datos_instancia.txt"
  }

  //provisioner es ejecutado por el usuario dado, ec2-user
  provisioner "remote-exec" {
    inline = [ 
      "echo 'hola mundo' > ~/saludo.txt"
     ]

     connection {
       type = "ssh"
       host = self.public_ip
       user = "ec2-user"
       private_key = file("C:/Users/r.negretega_vitaly/Desktop/Practicas_Terraform/practica_7/labsuser.pem")
     }
  }

  tags = {
    Name = "Ec2_Terraform"
  }

}
