variable "service_names" {
  type        = set(string)
  description = "Nombres de los servicios a desplegar"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia EC2"
  default     = "t3.micro"
}

variable "subnet_id" {
  type        = string
  description = "ID de la subred donde se lanzará la instancia EC2"
}


variable "security_group_id" {
  type        = string
  description = "ID del security group a asociar"
}

variable "environment" {
  type        = string
  description = "Entorno (dev/prod)"
}
