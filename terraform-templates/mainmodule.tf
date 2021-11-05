module "network" {
	source = "./network"
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
