data "aws_iam_user" "current" {
  user_name = "owner"
}

# Create new policies
resource "aws_iam_policy" "ec2_fa_policy" {
  name        = "ec2_fa_policy"
  description = "Allows FullAccess for VPC management"

  policy = data.aws_iam_policy_document.ec2_full-access_policy.json
}

resource "aws_iam_policy" "s3_fa_policy" {
  name        = "s3_fa_policy"
  description = "Allows FullAccess for VPC management"

  policy = data.aws_iam_policy_document.s3_full-access_policy.json
}

# Attach policies to current user
resource "aws_iam_user_policy_attachment" "user_ec2-fa-policy_attachment" {
  user       = data.aws_iam_user.current.user_name
  policy_arn = aws_iam_policy.ec2_fa_policy.arn
}

resource "aws_iam_user_policy_attachment" "user_s3-fa-policy_attachment" {
  user       = data.aws_iam_user.current.user_name
  policy_arn = aws_iam_policy.s3_fa_policy.arn
}
