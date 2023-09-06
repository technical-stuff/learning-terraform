#backend for development_team
terraform {
    backend "s3" {
        bucket          = "developmentteam-statefile-folder"
        key             = "development/terraform-dev.tfstate"
        region          = "us-east-1"
        dynamodb_table  = "terraform_dev_state"      
    }
}

