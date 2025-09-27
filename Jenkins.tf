

data "aws_ami" "latest_amazon_linux" {
  most_recent = true

owners = ["amazon"] # ✅ Only fetch AMIs owned by Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "jenkins_server" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = var.instance_type
  key_name                    = "linux-demo"
  subnet_id                   = aws_subnet.my_subnet-1.id
  vpc_security_group_ids      = [aws_security_group.my_security_group.id]
  availability_zone           = var.availability_zone_1
  associate_public_ip_address = true
  user_data                   = file("install_jenkins.sh")


  tags = {
    Name = "Jenkins-Server"
  }

}