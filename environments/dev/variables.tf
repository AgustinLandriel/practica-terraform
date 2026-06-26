

variable "service_name" {
  description = "The name of the service."
  type        = set(string)
}

variable "environment" {
  type = string
}

variable "prueba" {
  default = "prueba"
}
