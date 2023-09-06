#backend for testing_team
terraform {
    backend "s3" {
        bucket          = "testingteam-statefile-folder"
        key             = "testingteam/terraform-test.tfstate"
        region          = "ap-south-1"
        dynamodb_table = "terraform_test_state"  
    }  
}