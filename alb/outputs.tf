output "endpoint" {
    value = "${aws_lb.test.dns_name}:${var.application_port}"
}