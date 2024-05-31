resource "aws_instance" "jenkins" {
  ami             = "ami-0f58b397bc5c1f2e8"
  instance_type   = "t2.medium"
  subnet_id       = module.vpc.subnet_id
  security_groups = [module.security_groups.jenkins_sg.id]
  tags            = merge(var.tags, { Name : "Jenkins Server" })
  user_data       = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y install 
                service docker start
                usermod -a -G docker ec2-user
                sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
                https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
                echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
                https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
                /etc/apt/sources.list.d/jenkins.list > /dev/null
                sudo apt-get update
                sudo apt-get install jenkins
                sudo apt update
                sudo apt install openjdk-17-jdk
                sudo apt install openjdk-17-jre
                sudo systemctl enable jenkins
                sudo systemctl start jenkins
                sudo systemctl status jenkins
                EOF
}
resource "aws_instance" "sonarqube" {
  ami             = "ami-0f58b397bc5c1f2e8"
  instance_type   = "t2.medium"
  subnet_id       = module.vpc.subnet_id
  security_groups = [module.security_groups.sonarqube_sg.id]
  tags            = merge(var.tags, { Name : "SonarQube Server" })
  user_data       = <<-EOF
                #!/bin/bash
                sudo apt-get update
                sudo apt-get install -y docker
                sudo usermod -a -G docker ubuntu
                sudo systemctl start docker
                docker run -d --name sonarqube -p 9000:9000 sonarqube
                EOF
}

