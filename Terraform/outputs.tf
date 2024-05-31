#THIS FILE DEFINES THE OUTPUTS OF YOUR TERRAFORM RUN
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "subnet_id" {
  value = module.vpc.subnet_id
}
output "internet_gateway_id" {
  value = module.vpc.internet_gateway_id
}
output "ec2_instance_id" {
  value = module.ec2.instance_id
}
# output "eks_cluster.id" {
#   value = module.eks.cluster_id
# }
# output "ecr_repository_url" {
#   value = module.ecr.repository_url
# }
output "jenkins_instance_id" {
  value = aws_instance.jenkins
}
output "sonarqube_instance_id" {
  value = aws_instance.sonarqube
}
output "aws_dynamodb_table" {
  value = aws_dynamodb_table.terraform_locks.id
}
output "jenkins_sg_id" {
  value = aws_security_group.jenkins_sg_id
}
output "sonarqube_sg_id" {
  value = aws_security_group.sonarqube_sg_id
}
