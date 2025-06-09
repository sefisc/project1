# HTTP ingress from anywhere (port 80)
resource "aws_security_group_rule" "frontend_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
  description       = "HTTP from anywhere"
}

# Ingress port 5001 from ALB SG
resource "aws_security_group_rule" "frontend_5001_from_alb" {
  type                     = "ingress"
  from_port                = 5001
  to_port                  = 5001
  protocol                 = "tcp"
  security_group_id        = aws_security_group.frontend_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
  description              = "Result service on port 5001 from ALB"
}

# Ingress port 80 from ALB SG
resource "aws_security_group_rule" "frontend_80_from_alb" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.frontend_sg.id
  source_security_group_id = aws_security_group.alb_sg.id
  description              = "Vote service on port 80 from ALB"
}

# SSH ingress from anywhere (consider restricting CIDR to your IP)
resource "aws_security_group_rule" "frontend_ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
  description       = "SSH from anywhere"
}

# Egress: allow all outbound traffic
resource "aws_security_group_rule" "frontend_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.frontend_sg.id
  description       = "Allow all outbound"
}
