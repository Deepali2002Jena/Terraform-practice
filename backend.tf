//initialize the backend through the s3 
terraform {
  backend "s3" {
    bucket = "my-bucket-deepali-one"
    key    = "yahoo/terraform.tfstate"
    dynamodb_table= "terraform-state-locking"
  }
}
