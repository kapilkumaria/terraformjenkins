

resource "aws_instance" "bastion" {
    count                   = var.env == "prod" ? 1 : 0
    ami                     = var.ami-id-bastion
    instance_type           = var.instance-type-bastion
    subnet_id               = var.public-1a
    vpc_security_group_ids  = [var.sgforbastion]
    key_name                = var.key-name
    
    tags = {
      Name                  = var.bastion-ec2-tag
    }
}
    

resource "aws_instance" "web" {
  count                     = length(var.instance-web-tags)
  ami                       = lookup(var.ami, var.region)
  instance_type             = var.instance-type-web
  user_data                 = file(var.script)
  subnet_id                 = element(var.public-subnets, count.index)
  vpc_security_group_ids    = [var.sgforweb]
  key_name                  = var.key-name
    
  tags = {
    Name = element(var.instance-web-tags, count.index)
  }
}


resource "aws_instance" "db" {
  count                     = var.env == "prod" ? 1 : 0
  #count                     = length(var.instance-db-tags)
  ami                       = lookup(var.ami, var.region)
  instance_type             = var.instance-type-db
  subnet_id                 = element(var.private-subnets, count.index)
  vpc_security_group_ids    = [var.sgfordb]
  key_name                  = var.key-name
    
  tags = {
    Name = element(var.instance-db-tags, count.index)
  }
}