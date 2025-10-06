
# Vault provider for secret management
provider "vault" {
  address = "https://vault.example.com" # Replace with your Vault address
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.vault_role_id
      secret_id = var.vault_secret_id
    }
  }
}

# Fetch dynamic AWS credentials from Vault
data "vault_aws_access_credentials" "creds" {
  backend = "aws"
  role    = "my-aws-role" # Replace with your Vault role name
}

provider "aws" {
  region     = var.aws_region
  access_key = data.vault_aws_access_credentials.creds.access_key
  secret_key = data.vault_aws_access_credentials.creds.secret_key
  # session_token = data.vault_aws_access_credentials.creds.security_token # Uncomment if using STS
}

provider "aws" {
  alias  = "accepter"
  region = var.aws_region
  #profile = var.accepter_profile
}
