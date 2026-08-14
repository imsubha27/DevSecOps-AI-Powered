# iam.tf

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "jenkins_role" {
  name               = "${var.cluster_name}-jenkins-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.jenkins_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# resource "aws_iam_role_policy" "eks_access" {
#  name = "${var.cluster_name}-jenkins-eks-access"
#  role = aws_iam_role.jenkins_role.id

#  policy = jsonencode({
#    Version = "2012-10-17"
#    Statement = [{
#      Effect   = "Allow"
#      Action   = ["eks:DescribeCluster", "eks:ListClusters"]
#      Resource = var.eks_cluster_arn
#    }]
#  })
#}

resource "aws_iam_instance_profile" "jenkins_profile" {
  name = "${var.cluster_name}-jenkins-profile"
  role = aws_iam_role.jenkins_role.name
}