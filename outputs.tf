output "alb_dns_name" {
  value = aws_lb.https_alb.dns_name
}

output "instance_id" {
  value = aws_instance.web.id
}