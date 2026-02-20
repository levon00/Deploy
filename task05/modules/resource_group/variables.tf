variable "name" {
  type        = string
  description = "Name of resource group"
}

variable "location" {
  type        = string
  description = "location of resource group"
}

variable "tags" {
  type        = map(string)
  description = "tags of all resource"
}