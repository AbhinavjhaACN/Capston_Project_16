resource "aws_acm_certificate" "self_signed" {
  private_key      = file("${path.module}/key.pem")
  certificate_body = file("${path.module}/cert.pem")

  tags = {
    Name = "abhinav-p16-cert"
  }
}