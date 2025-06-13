resource "aws_instance" "myec2_roboshop" {
    count = 4
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_all.id ]
    tags = {
        Name = var.instances[count.index]
    }
}

resource "aws_security_group" "allow_all" {
    name        = var.sg_name
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