provider "aws" {
  profile = var.profile
  region  = var.region
}


resource "aws_instance" "worker_1" {
  ami                         = var.image_id
  instance_type               = var.instance_type_workers
  subnet_id                   = aws_subnet.subnet_for_webservers.id
  vpc_security_group_ids      = [aws_security_group.allow_port_22.id, aws_security_group.allow_port_80.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.my_pair_key.key_name
  
    connection {
			type        = "ssh"
			user        = "ubuntu"
			private_key = file("~/.ssh/aws")
			host        = self.public_ip
		}

  
  provisioner "remote-exec" {
    inline = [
      "cat /etc/lsb-release"
    ]
  }
}


resource "local_file" "hosts" {
    content = "[workers]\nworker ansible_host=${aws_instance.worker_1.public_ip} ansible_user=ubuntu\n[all:vars]\nansible_python_interpreter=/usr/bin/python3"
    filename = "../${path.module}/ansible/hosts"
}
