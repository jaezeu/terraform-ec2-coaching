resource "aws_instance" "public" {
  count                       = var.ec2_count
  ami                         = data.aws_ami.amazon2.id
  instance_type               = "t2.micro"
  subnet_id                   = data.aws_subnets.public.ids[0]
  iam_instance_profile        = aws_iam_instance_profile.example.name
  associate_public_ip_address = true
  key_name                    = var.enable_ssh_key ? aws_key_pair.key_pair[0].key_name : null
  user_data                   = <<EOF
#!/bin/bash
yum install -y httpd
systemctl enable httpd
systemctl start httpd
EOF
  user_data_replace_on_change = true # this forces instance to be recreated upon update of user data contents
  tags = {
    Name = "${var.prefix}-instance-${count.index}"
  }
}