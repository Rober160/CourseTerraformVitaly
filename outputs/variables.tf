variable "virginia_cidr" {
    description = "CIDR virginia"
    type = string
    sensitive = false
}

variable "subnets" {
  description = "Lista de subnets"
  type = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type = map(string)
}
