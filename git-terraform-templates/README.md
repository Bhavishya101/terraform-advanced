# Git-Terraform-Template

This repository consists of the terraform code to create the below Azure resources. The code for each resource type is maintained under their respective folder. The workspace created by ServiceNow in Terraform Cloud will point to the respective resource folder based on the type of catalog used.

## Branching strategy

These templates will refer to a particular verison of the module(s) hosted in terraform private registry.

```terraform
module "rhelvm" {
  source  = "app.terraform.io/aia_automation/rhelvm/azure"
  version = "1.2.53"
  # insert required variables here
}
```

1. Whenever a new version is published new version is published to the module, 
2. Create a new Release Branch with the an incrementing release number. Example `release/0.0.1`
3. Update the `version` parameter of the module block in `main.tf` file of appropriate resource type folder.
4. Update the latest version of each module that is being used in the table below.

Module Name      | Current Production Version  | Short description
-------------    | :-------------:  | -------------
Storage Account  | 0.0.34     | 
Load Balancer    | 0.0.29     | 
RHEL VM          | 1.2.53     | 
Windows VM       | 1.6.12     | 
Azure SQL DB     | 1.0.8      | 
Postgresql DB    | 1.9.49     | 
Azure SQL MI     | 0.8.154    | 
AKS              | 1.0.23     | 

5. Commit the changes and push the new release branch to the Bitbucket Cloud.
6. Set the new release branch name in the ServiceNow VCS Repositories config.