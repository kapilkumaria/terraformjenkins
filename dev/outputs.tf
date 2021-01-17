output "VPC_ID" {
   value = module.vpc.vpc_id
}

output "IGW_ID" {
   value = module.vpc.igw_id
}


output "SUBNET_PUBLIC_1a" {
   value = module.vpc.public-1a
}

output "SUBNET_PUBLIC_1b" {
   value = module.vpc.public-1b
}

output "SUBNET_PRIVATE_1a" {
   value = module.vpc.private-1a
}

output "SUBNET_PRIVATE_1b" {
   value = module.vpc.private-1b
}

output "BASTION_SG_ID" {
     value = module.sg.bastion_sg
}

output "WEB_SG_ID" {
     value = module.sg.web_sg
}

output "DB_SG_ID" {
     value = module.sg.db_sg
}

output "ALB_SG" {
     value = module.sg.alb_sg
}

output "PUBLIC_RT_ID" {
   value = module.vpc.public_rt_id
}

output "EIP_ID" {
   value = module.eip.eip_id
}

output "PRIVATE_RT_ID" {
   value = module.vpc.public_rt_id
}

output "NAT_ID" {
   value = module.vpc.nat_id
}

output "WEBSERVER_1a_ID" {
   value = module.ec2.web_1a_id
}

output "WEBSERVER_1b_ID" {
   value = module.ec2.web_1b_id
}

output "DBSERVER_1a_ID" {
   value = module.ec2.db_1a_id
}

output "DBSERVER_1b_ID" {
   value = module.ec2.db_1b_id
}

output "ALB_ID" {
   value = module.my_alb.alb-id
}

output "ALB_DNS_NAME" {
   value = module.my_alb.alb-dnsname
}
