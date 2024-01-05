resource "aws_security_group" "rds_security_group" {
  name        = "rds_security_group"
  description = "Allow inbound traffic from all IPv4 addresses"
  ingress = [
    {
      from_port        = var.rds_db_port
      to_port          = var.rds_db_port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow inbound traffic from all IPv4 addresses"
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
  }]
  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow outbound traffic from the instance"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
  }]
}

resource "aws_db_instance" "sample_rds" {
  allocated_storage      = var.rds_db_storage_size
  engine                 = var.rds_db_engine
  instance_class         = var.rds_db_instance_class
  username               = var.rds_username
  password               = random_password.example_password.result
  identifier             = replace("${var.rds_db_name}", "[^a-z0-9-]", "-")
  skip_final_snapshot    = var.rds_db_skip_final_snapshot
  publicly_accessible    = var.rds_db_publicly_accessible
  vpc_security_group_ids = [aws_security_group.rds_security_group.id]
  engine_version         = var.rds_db_engine_version
  tags = {
    Name = var.rds_db_tag
  }
}

resource "random_password" "example_password" {
  length  = 16
  special = true
}

output "rds_endpoint" {
  value = aws_db_instance.sample_rds.endpoint
}

output "rds_username" {
  value = aws_db_instance.sample_rds.username
}

output "rds_password" {
  value     = random_password.example_password.result
  sensitive = true
}
