variable "team" {
  type = string
  validation {
    condition = contains(["Development", "Finance", "Security"], var.team)
    error_message = "Please define the Team tag as Devops, Finance, or Security."
    }
}