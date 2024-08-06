provider "aws" {
  region = var.region
}

# Crear una política de IAM para el personal de RRHH
resource "aws_iam_policy" "hr_policy" {
  name        = var.hr_policy_name
  description = "Policy for HR personnel to access specific AWS resources"
  policy      = file(var.hr_policy_document)
}

# Crear un rol de IAM para el personal de RRHH
resource "aws_iam_role" "hr_role" {
  name = var.hr_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.hr_trusted_entities
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Adjuntar la política al rol de IAM
resource "aws_iam_role_policy_attachment" "hr_role_policy_attachment" {
  role       = aws_iam_role.hr_role.name
  policy_arn = aws_iam_policy.hr_policy.arn
}

# Crear usuarios de IAM para el personal de RRHH
resource "aws_iam_user" "hr_users" {
  for_each = toset(var.hr_usernames)
  name     = each.value
}

# Crear un grupo de IAM para el personal de RRHH
resource "aws_iam_group" "hr_group" {
  name = var.hr_group_name
}

# Adjuntar la política al grupo de IAM
resource "aws_iam_group_policy_attachment" "hr_group_policy_attachment" {
  group      = aws_iam_group.hr_group.name
  policy_arn = aws_iam_policy.hr_policy.arn
}

# Añadir usuarios al grupo de IAM
resource "aws_iam_user_group_membership" "hr_user_group_membership" {
  for_each = toset(var.hr_usernames)
  user     = each.value
  groups   = [aws_iam_group.hr_group.name]
}