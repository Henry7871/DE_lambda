resource "aws_s3_bucket" "backend-bucket" {
    bucket = "backend-bucket-DE-grp5"

    versioning {
        enabled = true 
    }
}

resource "aws_iam_role" "backend-s3" {
    name = "backend-s3"
    assume_role_policy=<<EOF
{
    
    "Version": "2012-10-17",
    "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::backend_s3"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject"],
      "Resource": "arn:aws:s3:::backend-s3" 
    }
    ]
    
}
EOF
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name         = "terraform-state-lock-dynamodb"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

resource "aws_iam_role" "backend-dynamodb" {
    name = "backend-dynamodb"
    assume_role_policy=<<EOF
{
    
    "Version": "2012-10-17",
    "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": "arn:aws:dynamodb:*:*:table/terraform-state-lock-dynamodb"
    }
  ]
}

EOF
}