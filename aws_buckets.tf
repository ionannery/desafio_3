resource "aws_s3_bucket" "terraform-state-bia" {
  bucket = "terraform-state-bia"

  tags = {
    Name = "Bucket do terraform"
  }
}
