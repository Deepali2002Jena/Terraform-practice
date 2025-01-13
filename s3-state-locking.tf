resource "aws_s3_bucket" "example" {
  bucket = "my-bucket-deepali-one"
  force_destroy= true
  tags= {
        Name= "Terraform state file storage"
 }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}

# create  a dynamodb
resource "aws_dynamodb_table" "dynamo-db" {
  name           = "terraform-state-locking"
  hash_key= "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }


}
