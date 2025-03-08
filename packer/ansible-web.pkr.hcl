packer {
  required_plugins {
    amazon = {
      version = ">= 1.3"
      source  = "github.com/hashicorp/amazon"
    }

    ansible = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  region        = "us-west-2"
  instance_type = "t2.micro"
  ami_name      = "packer-ansible-nginx"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250115"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    owners      = ["099720109477"]  # Canonical's AWS Account ID
    most_recent = true
  }
  ssh_username  = var.ssh_username
}

build {
  name = "packer-ansible-nginx"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "ansible" {
    playbook_file = "./ansible/playbook.yml"
    ansible_env_vars = ["ANSIBLE_HOST_KEY_CHECKING=False"]
    user = var.ssh_username
    use_proxy = false
  }
}
