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


############################################################################################
variable "pub-subnet-tags" {
    type    = list(string)
    default = ["kapil-pub-sub-1a", "kapil-pub-sub-1b"]
}

variable "pri-subnet-tags" {
    type    = list(string)
    default = [
        "kapil-pri-sub-1a",
        "kapil-pri-sub-1b"
    ]
}

############################################################################################

variable "pub-sub-azs" {
    type    = list(string)
    default = [
        "cac1-az1",
        "cac1-az2"
    ]
}

variable "pri-sub-azs" {
    type    = list(string)
    default = [
        "cac1-az1",
        "cac1-az2"
    ]
}


########################### VPC Route Tables ########################################

# Public RT Tag
variable "public-rt-tag" {
    default = "kapil-pub-rt"
}

variable "private-rt-tag" {
    default = "kapil-pri-rt"
}


##########################################################################################
variable "eip-id" {}
variable "pub-sub-ids" {}
variable "pub-sub-1a" {}
variable "pub-sub-1b" {}
variable "pri-sub-1a" {}
variable "pri-sub-1b" {}