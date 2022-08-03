output "endpoint" {
    value = "${aws_lb.alb.dns_name}:${var.application_port}"
}