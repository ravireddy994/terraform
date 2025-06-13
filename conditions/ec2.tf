resource "aws_instance" "myec2_roboshop" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    tags = {
        Name = "ec2-created-from-terraform"
    }
}

resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "allow all traffic"
}

resource "aws_security_group" "example" {
  # ... other configuration ...

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}