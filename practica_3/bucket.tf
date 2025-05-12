resource "aws_s3_bucket" "miprimerbucket" {
    bucket = "my-bucket-${random_string.random[count.index].id}"

    tags = {
        Owner = "Roberto"
        Name = "My bucket"
        Environment = "DevOps"
    }
}

resource "aws_s3_bucket_acl" "example" {
    bucket = aws_s3_bucket.miprimerbucket.id
    acl = "private"
}

resource "random_string" "random" {
    count = 4
    length = 8
    special = false
    upper = false
    numeric = false
}
