variable "ec2_count" {
  type        = number
  description = "Number of EC2 to create"
}

variable "prefix" {
  type        = string
  description = "Name prefix of the Instance"
}

variable "enable_ssh_key" {
  type        = bool
  description = "Whether to create EC2 ssh key"
  default     = false
}