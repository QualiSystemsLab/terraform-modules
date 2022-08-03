output "endpoint" {
    value = "${aws_lb.alb.dns_name}:${var.listener_port}"
}