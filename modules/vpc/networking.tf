
resource "aws_vpc" "terraformvpc" {
    cidr_block  = var.vpc-cidr
    
    tags = {
       Name     = var.vpc-tag
    }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terraformvpc.id

    tags = {
      Name = var.igw-tag
    }
}


resource "aws_nat_gateway" "nat" {
     subnet_id      = var.pub-sub-ids
     allocation_id  = var.eip-id

     tags = {
       Name = var.nat-tag
     }
}

######################################################################################
resource "aws_subnet" "pub-sub" {
  count = length(var.pub-subnet-tags)
  vpc_id = aws_vpc.terraformvpc.id
  cidr_block = cidrsubnet(var.vpc-cidr,2,count.index)
  availability_zone_id    = element(var.pub-sub-azs, count.index)
  map_public_ip_on_launch = true


  tags = {
     Name = var.pub-subnet-tags[count.index]
  }
}

resource "aws_subnet" "pri-sub" {
  count = length(var.pri-subnet-tags)
  vpc_id = aws_vpc.terraformvpc.id
  cidr_block = cidrsubnet(var.vpc-cidr,2,count.index + 2)
  availability_zone_id    = element(var.pri-sub-azs, count.index)
  map_public_ip_on_launch = false
    
  tags = {
     Name = var.pri-subnet-tags[count.index]
  }
}


resource "aws_route_table" "publicrt" {
   vpc_id = aws_vpc.terraformvpc.id

   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_internet_gateway.igw.id
   }

   tags = {
     Name = var.public-rt-tag
   }
}


resource "aws_route_table" "privatert" {
   vpc_id = aws_vpc.terraformvpc.id

   route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_nat_gateway.nat.id
   }

   tags = {
     Name = var.private-rt-tag
    }
}


resource "aws_route_table_association" "rta1" {
   subnet_id      = var.pub-sub-1a
   route_table_id = aws_route_table.publicrt.id
}
   

resource "aws_route_table_association" "rta2" {
   subnet_id      = var.pub-sub-1b
   route_table_id = aws_route_table.publicrt.id
}


resource "aws_route_table_association" "rta3" {
   subnet_id      = var.pri-sub-1a
   route_table_id = aws_route_table.privatert.id
}


resource "aws_route_table_association" "rta4" {
   subnet_id      = var.pri-sub-1b
   route_table_id = aws_route_table.privatert.id
}
