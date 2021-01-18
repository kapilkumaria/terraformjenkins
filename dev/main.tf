# terraform {
#    backend "s3" {
#       bucket         = "kapil-1dev"
#       key            = "global/s3/terraform.tfstate"
#       region         = "ca-central-1"
      
#       #dynamodb_table = "terraform-up-and-running-locks"
#       #encrypt        = true
#    }
# }

provider "aws" {
     region = var.region
}


module "vpc" {
    source           = "../modules/vpc"
    region           = var.region 
    vpc-cidr         = var.vpc-cidr
    tenancy          = var.tenancy
    vpc-tag          = var.vpc-tag
    igw-tag          = var.igw-tag
    nat-tag          = var.nat-tag
    eip-id           = module.eip.eip_id
    pub-sub-ids      = module.vpc.public-1a
    pub-sub-1a       = module.vpc.public-1a
    pub-sub-1b       = module.vpc.public-1b
    pri-sub-1a       = module.vpc.private-1a
    pri-sub-1b       = module.vpc.private-1b
    public-rt-tag    = var.public-rt-tag
    private-rt-tag   = var.private-rt-tag
}


module "sg" {
   source            = "../modules/sg"
   vpc-id            = module.vpc.vpc_id
   your-ip           = var.your-ip
   kapil-sg-bastion  = var.kapil-sg-bastion
   kapil-sg-web      = var.kapil-sg-web
   kapil-sg-db       = var.kapil-sg-db
   kapil-sg-alb      = var.kapil-sg-alb
}


module "eip" {
   source   = "../modules/eip"
   eip-tag  = var.eip-tag
}


module "ec2" {
   source                  = "../modules/ec2"
   region                  = var.region
   public-1a               = module.vpc.public-1a
   public-1b               = module.vpc.public-1b
   private-1a              = module.vpc.private-1a
   private-1b              = module.vpc.private-1b
   sgforbastion            = module.sg.bastion_sg
   sgforweb                = module.sg.web_sg 
   sgfordb                 = module.sg.db_sg
   public-subnets          = module.vpc.public_subnet_ids
   private-subnets         = module.vpc.private_subnet_ids
   instance-type-bastion   = var.instance-type-bastion
   instance-type-web       = var.instance-type-web
   instance-type-db        = var.instance-type-db 
   key-name                = var.key-name 
   bastion-ec2-tag         = var.bastion-ec2-tag
}


module "my_alb" {
   source                  = "../modules/alb"
   public-1a               = module.vpc.public-1a
   alb_vpc_id              = module.vpc.vpc_id
   alb_sg                  = module.sg.alb_sg
   subnet1a_public         = module.vpc.public-1a
   subnet1b_public         = module.vpc.public-1b
   instanceattachment1_id  = module.ec2.web_1a_id
   instanceattachment2_id  = module.ec2.web_1b_id
   alb-tag                 = var.alb-tag
   tg1-tag                 = var.tg1-tag
#   tg2-tag                 = var.tg2-tag
}
