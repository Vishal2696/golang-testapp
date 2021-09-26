module "network" {
	source = "./network"
}

module "rds" {
	source = "./rds"
	privatesubnetid01 = module.network.privsubnet01-id
	privatesubnetid02 = module.network.privsubnet02-id
	postgres_adminusername = var.postgres_adminusername
	postgres_adminpassword = var.postgres_adminpassword
	database_name = var.database_name
	rds_publicaccess = var.rds_publicaccess
	rds_secgrp_id = module.network.rds_sg_id
}
module "eks" {
	source = "./eks"
	kubernetes_version = var.kubernetes_version
	eks_iam_rolearn = module.iam.eks_iam_rolearn
	pubsubnet01-id = module.network.pubsubnet01-id
	pubsubnet02-id = module.network.pubsubnet02-id
	privsubnet01-id = module.network.privsubnet01-id
	privsubnet02-id = module.network.privsubnet02-id
	eks-control-sg-id = module.network.eks-control-sg-id
	eks_wkng_rolearn  = module.iam.eks_wkng_rolearn
}

module "iam" {
	source = "./iam"
}

output "rds_access_endpoint" {
	value = module.rds.rds_endpoint
}


