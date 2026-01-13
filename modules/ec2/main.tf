data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "this" {
  iam_instance_profile = var.iam_instance_profile
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  associate_public_ip_address      = true
  user_data_replace_on_change      = true

  vpc_security_group_ids = [var.ec2_security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              set -x

              if command -v dnf >/dev/null 2>&1; then
                dnf install -y httpd
              else
                yum install -y httpd
              fi

              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello from EC2 via ALB</h1>" > /var/www/html/index.html
              EOF
}

