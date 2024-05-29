# Jenkins Installation File

- This is the installation file, where you can find the installation commands..
- Or you can also find the `.sh` file.
- Provide permissions to this file and execute the file.
- Simply copy paste the commands to install Jenkins
  `sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key`

- This is to install jenkins
  `echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null`
- To update linux and install Jenkins from the installed package
  `sudo apt-get update`
  `sudo apt-get install jenkins`

`sudo apt update`
`sudo apt install openjdk-17-jdk`
`sudo apt install openjdk-17-jre`

`sudo systemctl enable jenkins`
`sudo systemctl start jenkins`
`sudo systemctl status jenkins`
