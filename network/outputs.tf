output "subnet_public_id"{
    value= aws_subnet.public_sub.id
}

output "subnet_private_id"{
    value= aws_subnet.private_sub.id
}

output "pub_sec_id"{
    value= aws_security_group.pub_sec.id
}

output "priv_sec_id"{
    value= aws_security_group.priv_sec.id
}