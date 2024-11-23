# variable for instance
variable "instance1_name" {
  description = "Name of the first EC2 instance"
  type        = string
}

variable "instance2_name" {
  description = "Name of the second EC2 instance"
  type        = string
}

# variable for az
variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

# variable for rds db
variable "db_username" {
  description = "RDS username"
  default     = "admin"
}

# variable for mysql db password
variable "db_password" {
  description = "RDS password"
  default     = "securepassword"
  sensitive   = true
}
