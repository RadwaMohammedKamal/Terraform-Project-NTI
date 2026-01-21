data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "this" {
  count = var.instance_count

  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = element(var.subnet_ids, count.index)
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  lifecycle {
    create_before_destroy = true
  }

  tags = var.tags

  provisioner "local-exec" {
    command = <<EOT
      mkdir -p /tmp/ansible_tmp
      chmod 700 /tmp/ansible_tmp

      chmod 600 ${var.private_key_path}

      # Wait until SSH is available
      for i in {1..30}; do
        nc -z ${self.public_ip} 22 && break
        sleep 10
      done

      echo "[web]" > /tmp/hosts
      echo "${self.public_ip} ansible_user=ec2-user ansible_private_key_file=${var.private_key_path} ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> /tmp/hosts

      HOME=/tmp TMPDIR=/tmp/ansible_tmp ansible-playbook -i /tmp/hosts ${path.module}/../../ansible/playbook.yml
    EOT
  }
}

output "public_ips" {
  value = aws_instance.this[*].public_ip
}
