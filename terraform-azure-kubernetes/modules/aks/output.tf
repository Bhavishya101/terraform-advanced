/*
output "subnet_id" {
    value = azurerm_subnet.aks_subnet.id
}
*/

output "host" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}

output "aks_cluster_name" {
    value = azurerm_kubernetes_cluster.aks.name
}

output "client_certificate" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
    sensitive   = true
}

output "client_key" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
    sensitive   = true
}

output "cluster_ca_certificate" {
    value = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
    sensitive   = true
}