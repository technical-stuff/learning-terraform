resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
    alarm_name          = var.alarm_name 
    metric_name         = var.metric_name
    namespace           = var.namespace
    period              = var.period
    statistic           = var.statistic
    comparison_operator = var.comparison_operator
    evaluation_periods  = var.evaluation_periods 
    threshold           = var.threshold 
    dimensions = {
      InstanceId        = var.instanceid_cloudwatch
    }

    alarm_description   = "To check the CPU Utilization"
    alarm_actions       = [var.alarm_actions_from_sns]
}


