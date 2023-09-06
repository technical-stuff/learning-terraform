#sns_topic creation for CPU_Utilization
resource "aws_sns_topic" "sns_mail" {
    name                = var.sns_name
}

#sbscription cration for sns_topic for CPU_Utilization
resource "aws_sns_topic_subscription" "sns_subscription" {
    topic_arn           = aws_sns_topic.sns_mail.arn
    protocol            = var.protocol_type
    endpoint            = var.email_id
}



