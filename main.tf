resource "aws_cloudwatch_metric_alarm" "credits" {
  actions_enabled           = true
alarm_actions             = []
alarm_name                = "go-credit-balance-${var.instance_id}"
comparison_operator       = "LessThanOrEqualToThreshold"
datapoints_to_alarm       = 1
dimensions                = {
  "InstanceId" = var.instance_id
}
evaluation_periods        = 1
insufficient_data_actions = []
metric_name               = "CPUCreditBalance"
namespace                 = "AWS/EC2"
ok_actions                = []
period                    = 300
statistic                 = "Average"
tags                      = var.common_tags
threshold                 = 30
treat_missing_data        = "missing"
}

resource "aws_cloudwatch_metric_alarm" "CPU" {
  actions_enabled           = true
  alarm_actions             = []
  alarm_name                = "go-cpu-${var.instance_id}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  datapoints_to_alarm       = 1
  dimensions                = {
    "InstanceId" = var.instance_id
  }
  evaluation_periods        = 1
  insufficient_data_actions = []
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  ok_actions                = []
  period                    = 300
  statistic                 = "Average"
  tags                      = var.common_tags
  threshold                 = 60
  treat_missing_data        = "missing"
}

