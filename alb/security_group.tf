resource "aws_security_group" "ALBSG" {
    name = "alb"
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    ingress {
        cidr_blocks = [var.allowed_cidr]
        description = "application port access"
        from_port = var.application_port
        protocol = "tcp"
        to_port = var.application_port
        ipv6_cidr_blocks = []
        prefix_list_ids = []
        security_groups = []
        self = false
    }

tags = {"Key": "Name","Value": "ALBSG"}
vpc_id = var.vpc
}