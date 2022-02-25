locals {
  node_driver_registrar_vol_mnt = [
    {
      name = "plugin-dir",
      mount_path = "/csi",
    },
    {
      name = "registration-dir",
      mount_path = "/registration",
    }
  ]
  secrets_store_vol_mnt = [
    {
      name = "plugin-dir",
      mount_path = "/csi",
    },
    {
      name = "mountpoint-dir",
      mount_path = "/var/lib/kubelet/pods",
      mount_propagation = "Bidirectional"
    },
    {
      name = "providers-dir"
      mount_path = "/etc/kubernetes/secrets-store-csi-providers"
    }
  ]
  liveness_probe_vol_mnt = [
    {
      name = "plugin-dir",
      mount_path = "/csi",
    }
  ]
}

locals {
  vol = [
    {
      name = "mountpoint-dir",
      path = "/var/lib/kubelet/pods",
      type = "DirectoryOrCreate",
    },
    {
      name = "registration-dir",
      path = "/var/lib/kubelet/plugins_registry/",
      type = "Directory",
    },
    {
      name = "providers-dir",
      path = "/etc/kubernetes/secrets-store-csi-providers",
      type = "DirectoryOrCreate",
    },
    {
      name = "plugin-dir",
      path = "/var/lib/kubelet/plugins/csi-secrets-store/",
      type = "DirectoryOrCreate",
    },
  ]
}

variable "environment" {}