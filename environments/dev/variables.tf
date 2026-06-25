variable "access_key" {
  description = "The access key for the cloud provider."
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "The secret key for the cloud provider."
  type        = string
  sensitive   = true
}

variable "service_name" {
  description = "The name of the service."
  type        = set(string)
}

variable "environment" {
 type = string
}