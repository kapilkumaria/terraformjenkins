output "bastion_sg" {
     value = aws_security_group.bastionsg.id
}

output "web_sg" {
     value = aws_security_group.websg.id
}

output "db_sg" {
     value = aws_security_group.dbsg.id
}

output "alb_sg" {
     value = aws_security_group.albsg.id
}

