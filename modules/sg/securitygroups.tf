
resource "aws_security_group" "bastionsg" {
    name          = "bastionsg"
    description   = "security group for bastion server"
    vpc_id        = var.vpc-id
    
    ingress {
      description = "Allow SSH connection from my computer only"
      from_port   = 22
      to_port     = 22
      protocol    = "TCP"
      cidr_blocks = [var.your-ip]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = var.kapil-sg-bastion
    }
}


resource "aws_security_group" "websg" {
    name        = "websg"
    description = "security group for web servers"
    vpc_id      = var.vpc-id

    ingress {
      description       = "Allow SSH connection from bastion server only"
      from_port         = 22
      to_port           = 22
      protocol          = "TCP"
      security_groups   = [aws_security_group.bastionsg.id]
    }

    ingress {
      description       = "Allow HTTP traffic from application LB only"
      from_port         = 80
      to_port           = 80
      protocol          = "TCP"
      security_groups   = [aws_security_group.albsg.id]
    }

    ingress {
      description       = "Allow HTTP traffic from application LB only"
      from_port         = 3000
      to_port           = 3000
      protocol          = "TCP"
      security_groups   = [aws_security_group.albsg.id]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = var.kapil-sg-web
    }
}


resource "aws_security_group" "dbsg" {
    name          = "dbsg"
    description   = "security group for database servers"
    vpc_id        = var.vpc-id

    ingress {
      description     = "Allow SSH connection from bastion server only"
      from_port       = 22
      to_port         = 22
      protocol        = "TCP"
      security_groups = [aws_security_group.bastionsg.id]
    }

    ingress {
      description       = "Allow HTTP traffic from web servers only"
      from_port         = 80
      to_port           = 80
      protocol          = "TCP"
      security_groups   = [aws_security_group.websg.id]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = var.kapil-sg-db
    }
}


resource "aws_security_group" "albsg" {
    name        = "albsg"
    description = "security group for application load balancer"
    vpc_id      = var.vpc-id

    ingress {
      description   = "Allow HTTP traffic from internet"
      from_port     = 80
      to_port       = 80
      protocol      = "TCP"
      cidr_blocks   = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    
    tags = {
      Name = var.kapil-sg-alb
    }
}

