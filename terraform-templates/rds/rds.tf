resource "aws_db_subnet_group" "rds" {
      name       = "subgrp-01"
      subnet_ids = [var.privatesubnetid01,var.privatesubnetid02]
}

resource "aws_db_instance" "db01" {
	engine               = "postgres"
	engine_version       = "10.17"
	instance_class       = "db.t3.micro"
	allocated_storage   = 20
	username 	     = var.postgres_adminusername
	password             = var.postgres_adminpassword
	identifier = "rds-apptest01"
	max_allocated_storage = 0
	name = var.database_name
	port	= 5432
	publicly_accessible = var.rds_publicaccess
	skip_final_snapshot = "true"
	storage_type 	= "gp2"
	db_subnet_group_name    = aws_db_subnet_group.rds.name
	vpc_security_group_ids	= [var.rds_secgrp_id]
}

output "rds_endpoint" {
	value = aws_db_instance.db01.endpoint
}
