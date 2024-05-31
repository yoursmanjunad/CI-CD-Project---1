resource "aws_security_group" "jenkins_sg" {
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  engress {
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = ["0.0.0.0/0"]
  }
  tags = merge(var.tags, { Name = "Jenkins Security Group" })
}
resource "aws_security_group" "sonarqube_sg" {
  vpc_id = module.vpc.vpc_id
  ingress {
    from_port  = 9000
    to_port    = 9000
    protocol   = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
  tags = merge(var.tags, { Name = "Sonarqube Security Group" })
}
