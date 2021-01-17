
output "web_1a_id" {
    value = aws_instance.web[0].id
}

output "web_1b_id" {
    value = aws_instance.web[1].id
}

output "db_1a_id" {
    value = aws_instance.db[0].id
}

output "db_1b_id" {
    value = aws_instance.db[1].id
}

output "web_ec2_ids" {
  value = aws_instance.web.*.id
}

output "db_ec2_ids" {
  value = aws_instance.db.*.id
}