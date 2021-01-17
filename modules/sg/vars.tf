# Your IP Address for Security Group
variable "your-ip" {
    default = "66.222.146.176/32"
}


# Bastion Security Group Tag
variable "kapil-sg-bastion" {
    default = "kapil_sg_bastion"
}


# Web Security Group Tag
variable "kapil-sg-web" {
    default = "kapil_sg_web"
}


# DB Security Group Tag
variable "kapil-sg-db" {
    default = "kapil_sg_db"
}


# ALB Security Group Tag
variable "kapil-sg-alb" {
    default = "kapil_sg_alb"
}

variable "vpc-id" {}








