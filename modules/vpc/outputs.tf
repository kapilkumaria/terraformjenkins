
output "vpc_id" {
     value = aws_vpc.terraformvpc.id
}

output "igw_id" {
     value = aws_internet_gateway.igw.id
}


output "public_subnet_ids" {
  value = aws_subnet.pub-sub.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.pri-sub.*.id
}

output "public-1a" {
     value = aws_subnet.pub-sub[0].id
} 

output "public-1b" {
     value = aws_subnet.pub-sub[1].id
}


output "private-1a" {
     value = aws_subnet.pri-sub[0].id
}

output "private-1b" {
     value = aws_subnet.pri-sub[1].id
}

output "public_rt_id" {
    value = aws_route_table.publicrt.id
}

output "private_rt_id" {
   value = aws_route_table.privatert.id
}


output "nat_id" {
   value = aws_nat_gateway.nat.id
}



