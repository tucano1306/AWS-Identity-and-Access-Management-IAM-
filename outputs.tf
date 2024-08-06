output "hr_policy_arn" {
  description = "The ARN of the IAM policy for HR personnel"
  value       = aws_iam_policy.hr_policy.arn
}

output "hr_role_arn" {
  description = "The ARN of the IAM role for HR personnel"
  value       = aws_iam_role.hr_role.arn
}

output "hr_group_name" {
  description = "The name of the IAM group for HR personnel"
  value       = aws_iam_group.hr_group.name
}

output "hr_usernames" {
  description = "The list of IAM usernames for HR personnel"
  value       = aws_iam_user.hr_users[*].name
}