# Folder structure

## .github/webooks 

GitHub Actions for CI/CD.

Actions are triggered on PRs and pushes to the master branch.  When a PR is merged an Action builds the Docker image and updates the k8s deployment YAML file with the new image tag then ArgoCD applies the changes in the cluster.

ArgoCD keeps a history of all updates and allows to rollback to any previous state of the application.

## .apps/hello-word: 

Source code, Dockerfile and k8s manifests for the GO app.

## .modules/eks

Terraform module for spinning up many individual k8s clusters for different teams with the concept of add-ons (`ArgoCD` and `AWS LB Controller` at the moment).

The cluster has federation enabled and allows to assign IAM Roles to Service Accounts.

**Improvements**:
- Move away from `Ingress` to using Istio for the service mesh with NLB for ingress
- Prometheus +  Grafana for monitoring and alerts
- Cillium CNI for network polices, pod-to-pod communication and pod-to-service communication (move away from IPTables)
- ExternalDNS for configuring Route53 records

## infrastructure

Terraform definition files.

## Links

[ArgoCD](http://k8s-default-argocdar-ae2726fa4c-970435522.us-east-1.elb.amazonaws.com)

[Hello word app](http://k8s-default-hellowor-e57865b09f-2139129445.us-east-1.elb.amazonaws.com)
