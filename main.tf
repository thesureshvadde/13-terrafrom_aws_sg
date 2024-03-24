resource "aws_security_group" "main" {
  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.vpc_id

  dynamic ingress {
    for_each = var.ingress
    content {
        description = ingress.value.description
        to_port     = ingress.value.to_port
        from_port   = ingress.value.from_port
        protocol    = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    description = "Allow All"
    to_port = 0
    from_port = 0 
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.sg_name}"
    }
  )
}