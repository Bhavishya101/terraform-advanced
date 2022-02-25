
provider "azurerm" {
  version = "=2.87"
  features {}
}


#provider "azuread" {}

provider "kubernetes" {
  #host                   = "${data.azurerm_kubernetes_cluster.aks.kube_config.0.host}"
   host                   = module.aks.host
  #client_certificate     = "${base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)}"
  client_certificate     = base64decode(module.aks.client_certificate)
  #client_key             = "${base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)}"
  client_key             = base64decode(module.aks.client_key)
  #cluster_ca_certificate = "${base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)}"
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    #config_path = "~/.kube/config"
    #host                   = "${module.azurerm_kubernetes_cluster.aks.kube_config.0.host}"
    host                   = module.aks.host
    #client_certificate     = "${base64decode(module.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)}"
    client_certificate     = base64decode(module.aks.client_certificate)
    #client_key             = "${base64decode(module.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)}"
    client_key             = base64decode(module.aks.client_key)
    #cluster_ca_certificate = "${base64decode(module.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)}"
    cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
  }
}


#provider "random" {
#    
#}

provider "azurerm" {
  alias = "GO01"
  subscription_id = "e8569be2-1379-4a99-a535-b2dc6b90757f"
  skip_provider_registration = true
  features {}
}