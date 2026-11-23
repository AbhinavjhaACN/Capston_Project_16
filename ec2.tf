resource "aws_instance" "web" {
  ami                    = data.aws_ami.al2023.id
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-USERDATA
#!/bin/bash

dnf install -y nginx

cat > /usr/share/nginx/html/index.html <<EOF
<h1>Project 16 HTTPS Working</h1>
<p>HTTPS configured through ALB and ACM</p>
EOF

systemctl enable nginx
systemctl start nginx
USERDATA

  tags = {
    Name = "abhinav-p16-web"
  }
}