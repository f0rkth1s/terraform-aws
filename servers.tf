resource "aws_network_interface" "web-server-nic" {
  subnet_id       = aws_subnet.subnet-1.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.allow_web.id]
  }

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.web-server-nic.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [aws_internet_gateway.gw]
}

resource "aws_instance" "web-server-instance" {
  ami = var.ami_image
  instance_type = "t2.micro"
  availability_zone = var.availability_zone_location
  key_name = var.key_pair_set

  network_interface {
      device_index = 0
      network_interface_id = aws_network_interface.web-server-nic.id
  }

user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt upgrade -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo Welcome to your first Terraformed web server! > /var/www/html/index.html'
                EOF
  tags = {
    Name = "web-server"
  }
}
