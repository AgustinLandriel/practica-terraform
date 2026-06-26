variable "environment" {
  type        = string
  description = "Entorno (dev/prod)"
}

variable "cidr" {
  type        = string
  description = "CIDR de la VPC"
}

variable "azs" {
  type        = list(string)
  description = "Availability zones"
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDRs de las subnets públicas"
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDRs de las subnets privadas"
}
