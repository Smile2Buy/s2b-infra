data "aws_iam_user" "current" {
  user_name = "owner"
}

# New IAM policy
resource "aws_iam_policy" "ec2_full-access_policy" {
  name        = "ec2_full-access_policy"
  description = "Allows FullAccess for VPC management"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:*"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

# Attach the policy to the current user
resource "aws_iam_user_policy_attachment" "user_ec2-fa-policy_attachment" {
  user       = data.aws_iam_user.current.user_name
  policy_arn = aws_iam_policy.ec2_full-access_policy.arn
}
