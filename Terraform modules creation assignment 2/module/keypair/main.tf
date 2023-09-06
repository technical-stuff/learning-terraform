#bastionserver keypair creation
resource "tls_private_key" "bastionkey" {
    rsa_bits        = 4096
    algorithm       = "RSA"  
}
resource "aws_key_pair" "bastionkeypair" {
    key_name        = var.key_namepair
    public_key      = tls_private_key.bastionkey.public_key_openssh 
}
resource "local_file" "bastionkeypair_local" {
    filename        = var.key_namepair_local
    content         = tls_private_key.bastionkey.private_key_pem
}