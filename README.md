
# GitHub Actions with Vault OIDC Demonstration

A demonstration of using GitHub OIDC to authenticate to HashiCorp Vault.

This repo accompanies a talk delivered at HashiConf Global at this link:  

Hashicorp: https://www.hashicorp.com/resources/using-oidc-with-hashicorp-vault-and-github-actions

Youtube: https://www.youtube.com/watch?v=lsWOx9bzAwY

## Terraform and HCP Integration Guide

The reason HCP is being used in the terraform scripts is because the `terraform.tf` file specifies a cloud configuration block as follows:

```hcl
cloud {
    organization = "<organization_name>"
    workspaces {
        name = "<workspace_name>"
    }
}
```

## Create a Hashicorp Cloud Platform Account

You will need an account on the Hashicorp Cloud Platform (HCP) to use this guide.

## Create a Project

Once you have an HCP account, if a default project does not exist, create a new project within the HCP.

## Creating a Service Principal in HCP

Create a Service Principal at the Project level (to use with Terraform) following this guide: [Service Principal Creation Guide](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/guides/auth)

- **HCP Client ID:** `<hcp_client_id>`
- **HCP Client Secret:** `<hcp_client_secret>`

## Configuring Vault

Note that environment variables don't directly work through the command line for this setup. The `HCP_CLIENT_ID` and `HCP_CLIENT_SECRET` must be predefined within HCP settings. It's necessary to configure these environment variables within HCP to ensure functionality.

## Executing Terraform

Commands to be executed:

```bash
terraform plan
terraform apply
```

## Post-Terraform Application

After successfully applying the Terraform configuration, you should see the following output:

```plaintext
Apply complete! Resources: 3 added, 0 changed, 0 destroyed.

Outputs:
vault_admin_token = "<vault_admin_token>"
vault_public_endpoint_url = "<vault_public_endpoint_url>"
```

## Configuring the Demo

Set the `VAULT_TOKEN` (using the vault_admin_token) and `GITHUB_TOKEN` as environment variables within the HCP cloud workspace, then execute the Terraform plan and apply commands with the respective variables:

```bash
terraform plan -var="vault_server_url=<vault_public_endpoint_url>" -var="github_organization=<github_organization>" -var="github_repository=<github_repository>"
terraform apply -var="vault_server_url=<vault_public_endpoint_url>" -var="github_organization=<github_organization>" -var="github_repository=<github_repository>"
```
