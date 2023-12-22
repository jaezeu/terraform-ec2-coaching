output "ec2_arn" {
  value = aws_instance.public[*].arn
}