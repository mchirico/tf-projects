
output "ec2-public-dns" {
  value = "\n      ssh -i ~/.ssh/rommel.pem ubuntu@${aws_instance.public-ec2.public_dns}\n      ssh  ubuntu@${aws_instance.public-ec2.public_dns}\n\n"
}

output "ec2-public-ip" {
  value = aws_instance.public-ec2.public_ip
}


output "ec2-public-private-dns" {
  value = aws_instance.public-ec2.private_dns
}

output "ec2-public-private-ip" {
  value = aws_instance.public-ec2.private_ip
}
