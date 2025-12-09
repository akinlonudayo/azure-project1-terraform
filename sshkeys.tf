resource "tls_private_key" "generated_ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  filename = "${path.module}/id_rsa"
  content  = tls_private_key.generated_ssh.private_key_pem
  file_permission = "0600"
}

resource "local_file" "ssh_public_key" {
  filename = "${path.module}/id_rsa.pub"
  content  = tls_private_key.generated_ssh.public_key_openssh
  file_permission = "0644"
}

output "ssh_public_key" {
  value = tls_private_key.generated_ssh.public_key_openssh
}

output "ssh_private_key_file" {
  value = "${path.module}/id_rsa"
}
