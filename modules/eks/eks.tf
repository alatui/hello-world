module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = local.fullname
  cluster_version = "1.20"
  subnets         = module.vpc.private_subnets

  tags = local.tags

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-a"
      instance_type                 = "t2.large"
      asg_desired_capacity          = 2
      asg_max_size                  = 5
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}