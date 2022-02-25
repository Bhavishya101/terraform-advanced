*****************************

# Azure Kubernetes Services

*****************************
Azure Kubernetes Service or popularly referred to as AKS is a managed Kubernetes platform hosted on Azure which supports various features including CNI's, AD integration, private clusters etc.
- More details on AKS can be found at: https://azure.microsoft.com/en-in/services/kubernetes-service/
- More details on Kubernetes can be found at: https://azure.microsoft.com/en-in/topic/what-is-kubernetes/ & https://kubernetes.io/

## Description of input variables

- `create_resource_group` => Mandatory; true or false  i.e. Boolean value; If false, existing resource group (RG) name should be specified and if true, new RG name should be given
- `resource_group_name` = Mandatory;  Name of resource group i.e. existing if field 'create_resource_group' is false and new name if true
- `location` = Mandatory => "southeastasia" or "eastasia": Location or Azure Region where resources are to be created
- `aks_cluster_name` => Mandatory ;  Name of the AKS cluster to be created
- `kubernetes_version` => Mandatory; = "1.19.0" : Version of kubernetes to be used to create cluster; As of this README being published Azure supports 1.19.7, 1.19.9 (default), 1.20.2 and 1.20.5; Deprecrated versions or soon to be deprecated, are 1.18.14 and 1.18.17
- `vm_size` => Mandatory; Size of the VM that is to be used. Only some sizes are supported E.g. "Standard_D2_v2"
- `os_disk_size_gb`  => Mandatory; Size of the OS disk E.g. 30
- `os_disk_type` => Mandatory; The type of disk which should be used for the Operating System. Possible values are "Ephemeral" and "Managed".
- `node_count` => Mandatory; Number of nodes to be added e.g. 1
- `node_max_pods` => Mandatory; Maximum number of pods that can be provisioned on each node. The min number is 30
- `node_enable_autoscale`  => Mandatory;  Boolean value that will true (enable)/false(disable) auto scaling
- `node_max_count`  => Mandatory ; Maximum number of nodes that will be scaled up to. E.g 1
- `node_min_count`  => Mandatory; Minimum number of nodes that will be scaled down to. Should align with `node_count`. E.g. 2

### Networking

#### vnet

- `vnet_name` => Mandatory; vNet to be used for AKS deployment
- `vnet_resource_group` => Mandatory; Resource Group of the vNet to be used for AKS deployment 
- `subnet_name` => Mandatory; subnet to be used for AKS deployment. This should be part of the vNet defined earlier

### Tags

#### Basic tags

- `environment` => Mandatory; Tags to the resource. Values of the environment to be used based on the mapping defined by AIA >>
  -  P  = "Production System"
  -  U  = "User Acceptance System/ QA"
  -  S  = "System Integration System"
  -  R  = "Disaster Recover System"
  -  G  = "Regression Test"
  -  D  = "Development System and Testing"
  -  N  = "Non-Production System"
- `project_name` => Mandatory; Tags to the resource. Name of project for which the resource is being requested to be entered
- `application_name` => Mandatory; Tags to the resource. Name of Application  for which the resource is being requested to be entered

#### Other Tags

- `ibm_imi_managed_env` => Mandatory; Tags to the resource. Values to be used based on the mapping defined by AIA, given above under environment
- `business_unit` => Mandatory; Tags to the resource. Business unit under which resource is to be created to be chosen
- `cost_center` => Cost center to be used for the resource request 
- `wbs_code` => Optional; Tags to the resource. WBS code to be entered
- `server_owner` => Mandatory; Tags to the resource. Name of the server owner to be entered
- `business_owner` => Mandatory; Tags to the resource. Name of the business owner to be entered
- `application_service` => Mandatory; Tags to the resource. Name of the application service to be entered
- `business_application` => Mandatory; Tags to the resource. Name of the business application to be entered
- `request_item_number` => Mandatory; Tags to the resource. Request Item number to be entered. For requests from Terraform use 'Terraform'

## Usage & Sample Values:

```hcl
module "kubernetes" {

  create_resource_group = false
  resource_group_name = "rg-go02-eas-n-terraform-test"
  location = "eastasia"
  aks_cluster_name = "aks-go02-eas-d-tfs07"
  kubernetes_version  = "1.19.9" 
  vm_size = "Standard_D2_v2" 
  os_disk_size_gb  = 30 
  os_disk_type = "Ephemeral"
  node_count = 1 

### Node pools 
  node_max_pods = 30 
  node_enable_autoscale  = true  
  node_max_count  =  5 
  node_min_count  =  2 

### Networking
#### vnet
  vnet_name = "vnet-go02-eas-p-nonprodsrv01"
  vnet_resource_group = "rg-go02-eas-p-nonprodsrv01-network01"
  subnet_name = "subnet-d-ccoe-lab01-10.238.222.0-24"
}

## Tags
locals {
  common_tags = { 
### Basic tags
  environment = "D"
  project_name = "akstest" 
  application_name =  "tfapp10"
  }
  extra_tags = {
### Other Tags
  ibm_imi_managed_env = "D"
  business_unit = "GO02" 
  cost_center = "R1.TTC1.01.1" 
  wbs_code = "Shared Services Ltd" 
  server_owner = "Sergey Fesenko" 
  business_owner = "Sergey Fesenko" 
  application_service = "AIA SSHK Test" 
  business_application = "AIA SSHK Test" 
  request_item_number = "Terraform"
  }
}
```

## Outputs

- `aks_cluster_name` = Name of the AKS cluster that will be provisioned
- `log_analytics_workspace_id` = ID of the log analytics workspace that will be tagged
- `msi_string` = The complete User managed identity that will be used based on subscription, region and environment
- `rg_name` = Name of the resource group where AKS cluster will be provisioned
- `subnet_id` => ID of the subnet to be used
- `subscription_id` = ID of the subscription that will be used
- `subscription_name` = Name of the subscription that will be used