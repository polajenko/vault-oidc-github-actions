terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~>3.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }

  cloud {
    organization = "polajenko-tf-org"

    workspaces {
      name = "oidc-github-demo"
    }
  }
}

