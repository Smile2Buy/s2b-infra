data "aws_iam_user" "current" {
  user_name = "owner"
}

# New IAM policy
resource "aws_iam_policy" "ec2_full-access_policy" {
  name        = "ec2_full-access_policy"
  description = "Allows FullAccess for VPC management"

  policy = data.aws_iam_policy_document.ec2_full-access_policy.json
}

# Attach the policy to the current user
resource "aws_iam_user_policy_attachment" "user_ec2-fa-policy_attachment" {
  user       = data.aws_iam_user.current.user_name
  policy_arn = aws_iam_policy.ec2_full-access_policy.arn
}
