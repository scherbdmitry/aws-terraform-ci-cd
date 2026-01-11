output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_a_id" {
  value = aws_subnet.public_a.id
}

output "instance_public_ip" {
  value = aws_instance.web.public_ip
}

output "demo_url" {
  value = "http://${aws_instance.web.public_ip}"
}