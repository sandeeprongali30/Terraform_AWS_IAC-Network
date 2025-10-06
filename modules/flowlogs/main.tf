# CloudWatch Log Group for VPC Flow Logs
resource "aws_cloudwatch_log_group" "flow_log_group" {
  name              = var.log_group_name
  retention_in_days = 30
  tags = {
    Env = var.env
  }
}

# VPC Flow Log
resource "aws_flow_log" "vpc_flow_log" {
  log_destination = aws_cloudwatch_log_group.flow_log_group.name
  iam_role_arn    = var.aws_iam_role_arn
  vpc_id          = var.vpc_id
  traffic_type    = "ALL"
  tags = {
    Env = var.env
  }
}
