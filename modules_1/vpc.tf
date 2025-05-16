resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  tags = {
    Name = "VPC_VIRGINIA-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true //asignamos direccionamiento publico para la subnet
  tags = {
    Name = "Public subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "Private subnet-${local.sufix}"
  }
}


//Conectividad a internet
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw vpc virginia-${local.sufix}"
  }
}

resource "aws_route_table" "public_crt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gw.id
  }
  
  tags = {
    Name = "CRT-${local.sufix}"
  }
}

resource "aws_route_table_association" "crta_public_subnet" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_crt.id
}


//Grupos de seguridad
resource "aws_security_group" "sg_public_instance" {
  name = "Public Instance SG"
  description = "Permitir SSH de entrada y permitir todo de salida"
  vpc_id = aws_vpc.vpc_virginia.id

  //Reemplazamos el código repetido de los bloques ingress
  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port = ingress.value //referencia al for_each
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Public Instance SG-${local.sufix}"
  }
}

module "mys3" {
  source = "./modulos/s3"
  bucket_name = "s3unico43215"
}

output "s3_arn" {
  value = module.mys3.s3_bucket_arn
}
