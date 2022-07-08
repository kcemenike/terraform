variable "ID" {
  description = "Name tag for the EC2 instance"
  type        = string
  default     = github.run_id
}
