module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "jenkins-eks"
  cluster_version = "1.29"

  subnet_ids = data.aws_subnets.default.ids
  vpc_id     = data.aws_vpc.default.id

  eks_managed_node_groups = {
    nodes = {
      desired_size = 2
      instance_types = ["t3.medium"]
    }
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}
