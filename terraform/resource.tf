#Create VPC with CIDR block
resource "aws_default_vpc" "AUTOMATION_HERO_VPC" {
  tags = {
    Name = "AUTOMATION_HERO_VPC"
  }
}

#Create security groups

#Security group for nginx servers
resource "aws_security_group" "AUTOMATION_HERO_SG" {
  name = "AUTOMATION_HERO_SG"
  description = "Enable ssh access and http access"
  vpc_id = aws_default_vpc.AUTOMATION_HERO_VPC.id

  ingress {
    description = "SSH access by given IP"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["81.65.175.29/32"]
  }   
  ingress {
    description = "HTTP access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 

  ingress {
    description = "HTTPS access"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
      Name = "AUTOMATION_HERO_SG"
  }
}

#create ec2 instance
resource "aws_instance" "AUTOMATION_HERO_NGINX" {
  ami = "ami-0fb653ca2d3203ac1"
  instance_type = "t2.micro"
  key_name = "test-ohio"
  security_groups = [aws_security_group.AUTOMATION_HERO_SG.name]
  associate_public_ip_address = true
  tags = {
    Name = "AUTOMATION_HERO_NGINX_SERVER"
  }
}
