#aws_keypair_bastionServer
#resource "tls_private_key" "bastionkey" {
#    algorithm = "RSA"
#    rsa_bits = 4096
#}
#resource "aws_key_pair" "bastion_keypair" {
#    key_name = "bastionkey"
#    public_key = tls_private_key.bastion_keypair.public_key_openssh
#}
#resource "local_file" "bastionpemfile" {
#       filename = "bastionpemfile"
#       content = tls_private_key.bastionkey.private_key_pem
#}

#aws_keypair_applicationServer1_private
resource "tls_private_key" "application1" {
    algorithm = "RSA"
    rsa_bits = 4096
}
resource "aws_key_pair" "application1_keypair" {
    key_name = "application1pemfile"
    public_key = tls_private_key.application1.public_key_openssh
}
resource "local_file" "application1pemfile" {
    filename = "application1pemfile"
    content = tls_private_key.application1.private_key_pem
}

#aws_keypair_applicationServer2_private
resource "tls_private_key" "application2" {
    algorithm = "RSA"
    rsa_bits = 4096
}
resource "aws_key_pair" "application2_keypair" {
    key_name = "application2pemfile"
    public_key = tls_private_key.application2.public_key_openssh
}
resource "local_file" "application2pemfile" {
    filename = "application2pemfile"
    content = tls_private_key.application2.private_key_pem
}