resource "aws_instance" "web" {
  ami                    = data.aws_ami.amiID.id
  instance_type          = "t3.micro"
  key_name               = "deployer-key"
  vpc_security_group_ids = [aws_security_group.dov-sg.id]
  availability_zone      = "us-east-1a"

  tags = {
    Name    = "dove-web"
    project = "dove"
  }
}
resource "aws_ec2_instance_state" "web-state" {
  instance_id = aws_instance.web.id
  state="running"
  
}