# resource "aws_eks_cluster" "main_cluster" {
#   name     = "main-cluster"
#   role_arn = module.iam.eks_cluster_role_arn
#   vpc_config {
#     subnet_ids = [module.vpc.subnet_id]
#   }
#   tags
# }
