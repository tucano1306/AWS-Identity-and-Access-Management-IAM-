variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "us-west-2"
}

variable "hr_policy_name" {
  description = "The name of the IAM policy for HR personnel"
  type        = string
  default     = "HRPolicy"
}

variable "hr_policy_document" {
  description = "The JSON file containing the IAM policy document for HR personnel"
  type        = string
  default     = "hr_policy.json"
}

variable "hr_role_name" {
  description = "The name of the IAM role for HR personnel"
  type        = string
  default     = "HRRole"
}

variable "hr_trusted_entities" {
  description = "The list of trusted entities that can assume the HR role"
  type        = list(string)
  default     = ["arn:aws:iam::123456789012:root"]  # Replace with actual trusted entities
}

variable "hr_usernames" {
  description = "The list of IAM usernames for HR personnel"
  type        = list(string)
  default     = ["alice", "bob", "carol"]
}

variable "hr_group_name" {
  description = "The name of the IAM group for HR personnel"
  type        = string
  default     = "HRGroup"
}