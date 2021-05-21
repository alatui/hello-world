resource "helm_release" "argo-cd" {
  name          = "argo-cd"
  chart         = "argo-cd"
  repository    = "https://argoproj.github.io/argo-helm"
  wait          = true

  values = [
   file("${path.module}/yaml/argo-cd.yaml")
  ]

  depends_on = [
    helm_release.aws-load-balancer-controller
  ]
  
}
