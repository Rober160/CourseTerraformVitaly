variable "virginia_cidr" {
    description = "CIDR virginia"
    type = string
    sensitive = false
}

#variable "public_subnet" {
#  description = "CIDR public subnet"
#  type = string
#}
#
#variable "private_subnet" {
#  description = "CIDR private subnet"
#  type = string
#}

variable "subnets" {
  description = "Lista de subnets"
  type = list(string)
}
