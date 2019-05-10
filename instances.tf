resource "aws_key_pair" "terraformkeypair" {
  key_name = "terraformkeypair"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_security_group" "allow_tls" {
  name = "allow_tls"
  description = "Allow TLS inbound traffic"
  ingress {
    # TLS (change to whatever ports you need)
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ansible" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.small"
  key_name = "${aws_key_pair.terraformkeypair.key_name}"
  security_groups = ["allow_tls"]

  /*
  provisioner "file" {
    source = "playbook.yml"
    destination = "/etc/ansible/playbook/playbook.yml"
  }
  */
  provisioner "remote-exec" {
    inline = [
      /*
      "sleep 90",
      "sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y",
      "sudo yum install ansible -y",
      "ansible --version",
      "git clone https://devopsmastek:Mastek%401234@github.com/devopsmastek/assemblyline.git",
      "sudo ansible-playbook  /home/ubuntu/assemblyline/ansible/playbook.yml"
      */

      "sudo apt-get update",
      "sleep 10",
      "sudo apt-get install software-properties-common",
      "sleep 10",
      "sudo apt-add-repository --yes --update ppa:ansible/ansible",
      "sleep 10",
      "sudo apt-get install ansible -y",
      "sleep 10",
      "ansible --version",
      "git clone -b dev  https://devopsmastek:Mastek%401234@github.com/devopsmastek/assemblyline.git",
      "sleep 30",
      "sudo -H ansible-playbook /home/ubuntu/assemblyline/ansible/playbook.yml"
    ]
  }

  connection {
    type = "ssh",
    user = "ubuntu"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout = "3m"
    agent = false
  }

}
