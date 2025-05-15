virginia_cidr = "10.10.0.0/16"

subnets = ["10.10.0.0/24", "10.10.1.0/24"]
tags = {
  "Environment" = "DevOps"
  "Owner"       = "Roberto"
  "Cloud"       = "AWS"
  "IAC"         = "Terraform"
  "IAC_version" = "1.11.4"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-085386e29e44dacd7"
  "instance_type" = "t2.micro"
}

enable_monitoring = 1 //condicional
