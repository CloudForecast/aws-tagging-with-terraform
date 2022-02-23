variable "tags" {
  type = map(string)
  validation {
    condition = alltrue([for t in ["Env", "Team", "Service"] : contains(keys(var.tags),t)])
    error_message = "Please include tags for Env, Team, and Service."
    }
}


