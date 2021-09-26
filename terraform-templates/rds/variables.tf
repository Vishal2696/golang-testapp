variable "privatesubnetid01" {
   description = "ID of private subnet"
}

variable "privatesubnetid02" {
   description = "ID of private subnet"
}

variable "postgres_adminusername" {
   description = "admin username for postgres db"
}

variable "postgres_adminpassword" {
   description = "admin user password for postgres db"
}

variable "database_name" {
   description = "Name of the database created in rds"
}

variable "rds_publicaccess" {
   description = "boolean value indicating RDS access from public network"
}

variable "rds_secgrp_id" {
   description = "ID of the security grp attached to RDS"
}

