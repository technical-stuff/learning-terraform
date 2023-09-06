#application_server output 
output "applicationserver_output" {
    value = aws_instance.application_server[*].id
}