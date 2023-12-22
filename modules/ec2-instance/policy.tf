resource "aws_iam_role" "example" {
  name = "${var.prefix}-ec2-tf-ssm-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "example" {
  name = "${var.prefix}-ec2-profile"
  role = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "example-attach" {
  role       = aws_iam_role.example.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}