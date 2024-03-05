terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = ">=0.41.0"
    }
  }

  cloud {
    organization = "polajenko-tf-org"

    workspaces {
      name = "oidc-vault-cluster"
    }
  }
}



