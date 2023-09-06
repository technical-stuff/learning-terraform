#output to display the sns_arn 
output "sns_arn_output" {
    value = aws_sns_topic.sns_mail.arn  
}