
variable "env" {
    default = "dev"
}

########################### AMI IDs for EC2 Instances (Bastion, Web and DB Servers) #############################
#AMI ID for Bastion/Jump-Box Server
variable "ami-id-bastion" {
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


#########################################################################################


variable "ami" {
    type = map

    default = {
        "ca-central-1"  = "ami-02e44367276fe7adc"
        "us-east-1"     = "ami-02e44367276fe7adc"
    }
}

variable "instance-count" {
     default = 2
}


variable "instance-web-tags" {
    type    = list
    default = ["kapil_webserver1a", "kapil_webserver1b"]
}

variable "instance-db-tags" {
    type    = list
    default = ["kapil_dbserver1a", "kapil_dbserver1b"]
}


variable "script" {
    default = "webserver-script.sh"
}

#########################################################################################

variable "region" {}
variable "public-subnets" {}
variable "private-subnets" {}
variable "public-1a" {}
variable "public-1b" {}
variable "private-1a" {}
variable "private-1b" {}
variable "sgforbastion" {}
variable "sgforweb" {}
variable "sgfordb" {}































