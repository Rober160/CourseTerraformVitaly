variable "virginia_cidr" {
  description = "CIDR virginia"
  type        = string
  sensitive   = false
}

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "Tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR para el tráfico de entrada"
  type = string
}

variable "ec2_specs" {
  description = "Parámetros de la instancia"
  type = map(string)
}

//condicional
variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type = number
}
