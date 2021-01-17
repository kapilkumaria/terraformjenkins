
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


variable "dynamodb-table-tag" {
     default = "kapil_terraform-locking"
}

########################### AMI IDs for EC2 Instances (Bastion, Web and DB Servers) #############################
# AMI ID for Bastion/Jump-Box Server
variable "ami-id-bastion" {
    default = "ami-02e44367276fe7adc"
}

# AMI ID for Web Servers
variable "ami-id-web" {
    default = "ami-02e44367276fe7adc"
}

# AMI ID for Database Servers
variable "ami-id-db" {
    default = "ami-02e44367276fe7adc"
}

########################### Instance Types for EC2 Instances (Bastion, Web and DB Servers) #############################
# Instance Type for Web Servers
variable "instance-type-bastion" {
    default = "t2.micro"
}

# Instance Type for Web Servers
variable "instance-type-web" {
    default = "t2.micro"
}

# Instance Type for DB Servers
variable "instance-type-db" {
    default = "t2.micro"
}

########################### Key-Name for EC2 Instances (Bastion, Web and DB Servers) #############################
# Key-Name for Launching EC2 Instances
variable "key-name" {
    default = "kapilKP"
}

########################### EC2 Instances (Bastion, Web and DB Servers) Tags #####################################
# Bastion Server Tag
variable "bastion-ec2-tag" {
    default = "kapil-bastion"
}

# Web Server 1a Tag
variable "web1a-ec2-tag" {
    default = "kapil-web-1a"
}

# Web Server 1b Tag
variable "web1b-ec2-tag" {
    default = "kapil-web-1b"
}

# Database Server 1a Tag
variable "db1a-ec2-tag" {
    default = "kapil-db-1a"
}

# Database Server 1b Tag
variable "db1b-ec2-tag" {
    default = "kapil-db-1b"
}

#########################################################################################

variable "eip-tag" {
   default = "kapil_eip"
}

#variable "eip_id" {}


variable "s3-bucket-name" {
    default = "kapil-terraform-remote-backend-bucket-2020"
}


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

#variable "vpc-id" {}

## Region in which the resources to be deployed
variable "region" {
    default = "ca-central-1"
}

# VPC CIDR Block
variable "vpc-cidr" {
    default = "192.168.0.0/26"
}

# VPC Tenancy
variable "tenancy" {
   default = "default"
}

# VPC Tag
variable "vpc-tag" {
    default = "kapil_vpc"
}

#IGW Tag
variable "igw-tag" {
    default = "kapil_igw"
}

#NAT Tag
variable "nat-tag" {
    default = "kapil_nat"
}

########################### Subnets CIDR Blocks #############################
# Public Subnet in 1a - CIDR Block
variable "sub-pub-1a-cidr" {
    default = "192.168.0.0/28"
}

# Public Subnet in 1b - CIDR Block
variable "sub-pub-1b-cidr" {
    default = "192.168.0.16/28"
}

# Private Subnet in 1a - CIDR Block
variable "sub-pri-1a-cidr" {
    default = "192.168.0.32/28"
}

# Private Subnet in 1b - CIDR Block
variable "sub-pri-1b-cidr" {
    default = "192.168.0.48/28"
}

########################### Subnets CIDR Tags #############################
# Public Subnet in 1a - Tag
variable "sub-pub-1a-tag" {
    default = "sub_pub_1a_tag"
}

# Public Subnet in 1b - Tag
variable "sub-pub-1b-tag" {
    default = "sub_pub_1b_tag"
}

# Private Subnet in 1a - Tag
variable "sub-pri-1a-tag" {
    default = "sub_pri_1a_tag"
}

# Private Subnet in 1b - Tag
variable "sub-pri-1b-tag" {
    default = "sub_pri_1b_tag"
}


########################### Subnets Availablilty Zones #############################
# Availablilty Zone for Public Subnet in 1a
variable "az-pub-1a" {
    default = "cac1-az1"
}

# Availablilty Zone for Public Subnet in 1b
variable "az-pub-1b" {
   default = "cac1-az2"
}

# Availablilty Zone for Private Subnet in 1a
variable "az-pri-1a" {
   default = "cac1-az1"
}

# Availablilty Zone for Private Subnet in 1b
variable "az-pri-1b" {
   default = "cac1-az2"
}

########################### VPC Route Tables ########################################

# Public RT Tag
variable "public-rt-tag" {
    default = "kapil-pub-rt"
}

variable "private-rt-tag" {
    default = "kapil-pri-rt"
}



