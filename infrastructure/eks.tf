module  "apollo_eks_prod" {
    source          = "../modules/eks"
    providers       = {
        aws = aws.virginia
    }
    team            = "apollo"
    environment     = "production"
}
