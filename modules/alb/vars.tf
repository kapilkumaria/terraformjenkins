
# ALB Tag
variable "alb-tag" {
    default = "kapil-alb"
}

# Target Group 1 Tag
variable "tg1-tag" {
    default = "kapil-logfiles-tg"
}

# Target Group 2 Tag
variable "tg2-tag" {
    default = "kapil-images-tg"
}



variable "public-1a" {}
variable "alb_vpc_id" {}
variable "alb_sg" {}
variable "subnet1a_public" {}
variable "subnet1b_public" {}
variable "instanceattachment1_id" {}
variable "instanceattachment2_id" {}