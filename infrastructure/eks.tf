module  "jupyter_eks_production" {
    source          = "../modules/eks"
    providers       = {
        aws = aws.virginia
    }
    team            = "jupyter"
    environment     = "production"
}
