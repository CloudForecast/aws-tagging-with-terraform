variable "service" {
  type = string
  validation {
    condition = contains(["S3", "EC2", "RDS"], var.service)
    error_message = "Please define service tag."
    }
}

variable "team" {
  type = string
  validation {
    condition = contains(["devops", "finance", "security"], var.team)
    error_message = "Please define the Team tag as devops, finance, or security."
    }
}
