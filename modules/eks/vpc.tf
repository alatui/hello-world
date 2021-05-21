module "vpc" {
    source              = "terraform-aws-modules/vpc/aws"
    version             = "3.0.0"

    name                = local.fullname
    cidr                = "10.0.0.0/16"
    azs                 = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}b"]
    private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
    public_subnets      = ["10.0.4.0/24", "10.0.5.0/24"]
    enable_nat_gateway  = true
    single_nat_gateway  = true

    tags = local.tags

    public_subnet_tags = {
        "kubernetes.io/cluster/${local.fullname}"     = "shared"
        "kubernetes.io/role/elb"                      = "1"
    }

    private_subnet_tags = {
        "kubernetes.io/cluster/${local.fullname}"     = "shared"
        "kubernetes.io/role/internal-elb"             = "1"
    }
}

