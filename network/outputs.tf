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

output "vpc_subnets_group_name"{
    value= aws_db_subnet_group.vpc_subnets.id
}

output "db_sg_id"{
    value= aws_security_group.db_sg.id
}

output "ecash_sub_names" {
  value = "${aws_elasticache_subnet_group.ecash_sub_group.name}"  
}