# ARN to target endpoint for access buckets privilegies
resource "aws_iam_role" "iam_for_s3target_endpoint" {
  name = "${var.service_name}-role-${var.env}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dms.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "s3_bucket_access" {
  name = "${var.service_name}-s3-access-to-bucket-${var.env}"
  role = aws_iam_role.iam_for_s3target_endpoint.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": ["arn:aws:s3:::${var.bucket_name}/*", "arn:aws:s3:::${var.bucket_name}*"]
        }
    ]
}
EOF
}

