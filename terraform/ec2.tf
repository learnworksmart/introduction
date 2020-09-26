resource "aws_instance" "base_ec2_01" {
  # Amazon Linux 2 AMI (HVM), SSD Volume Type (64-bit x86)
  ami                    = "ami-015a6758451df3cb9"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.base_key_pair.key_name
  vpc_security_group_ids = ["${aws_security_group.base_allow_ssh.id}"]

  tags    = { 
    Name  = "base-ec2-01"
    OS    = "Amazon-Linux-2"
  }
}
