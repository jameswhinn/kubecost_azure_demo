# provider "helm" {

# }

# data "helm_repository" "kubecost" {
#   name = "kubecost"
#   url  = "https://kubecost.github.io/cost-analyzer/"
# }

# resource "helm_release" "kubecost" {
#   name       = "my-cache"
#   repository = "${data.helm_repository.kubecost.metadata[0].name}"
#   chart      = "kubecost"
# }