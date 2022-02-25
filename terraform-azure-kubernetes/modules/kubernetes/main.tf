resource "kubernetes_namespace" "ns" {
  count = upper(var.environment) == "P" ? 1 : 0
  metadata {
    name = "twistlock"                              
  }
}

########### CSI drivers ########

resource "helm_release" "az_key_vault_secret_csi" {
  name       = "csi-secrets-store-provider-azure"

  repository = "https://raw.githubusercontent.com/Azure/secrets-store-csi-driver-provider-azure/master/charts"
  chart      = "csi-secrets-store-provider-azure"

  namespace  = "default"
}
