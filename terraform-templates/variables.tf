variable "postgres_adminusername" {
    description = "admin username of postgres db"
}

variable "postgres_adminpassword" {
    description = "password for admin user of postgres db"
}

variable "database_name" {
    description = "name of the database in postgres"
}

variable "rds_publicaccess" {
    description = "boolean value for public access of rds"
}

variable "kubernetes_version" {
    description = "Kubernetes control plane version"
}

