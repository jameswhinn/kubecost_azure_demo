provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name = "kubecost_poc"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "kubecost_poc"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  dns_prefix          = "kubecostpoc"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  service_principal {
    client_id     = "bb52b1d3-31b7-4165-acc0-25f50525f4bf"
    client_secret = "1f8c1d36-88d5-4202-9bcc-200f68126360"
  }

  tags = {
    Environment = "Production"
  }
}

resource "null_resource" "kubectl" {
  provisioner "local-exec" {
      command = "az aks get-credentials --resource-group ${azurerm_resource_group.rg.name} --name ${azurerm_kubernetes_cluster.cluster.name}"
  }
}

output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.cluster.kube_config_raw}"
}
