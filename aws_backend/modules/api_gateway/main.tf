provider "aws" {
  region = "us-east-1"
}

#Creates the REST api 
resource "aws_api_gateway_rest_api" "slack_api" {
  name        = "slack-bot-api"
  description = "API Gateway for Slack bot requests"
}

#Create the event resource 
resource "aws_api_gateway_resource" "event" {
  rest_api_id = aws_api_gateway_rest_api.slack_api.id
  parent_id   = aws_api_gateway_rest_api.slack_api.root_resource_id
  path_part   = "event"
}

#Add the POST method
resource "aws_api_gateway_method" "post_event" {
  rest_api_id   = aws_api_gateway_rest_api.slack_api.id
  resource_id   = aws_api_gateway_resource.event.id
  http_method   = "POST"
  authorization = "NONE"
}

#Integrate with Lambda
resource "aws_api_gateway_integration" "event_integration" {
  rest_api_id             = aws_api_gateway_rest_api.slack_api.id
  resource_id             = aws_api_gateway_resource.event.id
  http_method             = aws_api_gateway_method.post_event.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/${var.api_lambda_arn}/invocations"
}

# Create a deployment (a snapshot of your API configuration)
resource "aws_api_gateway_deployment" "slack_api_deployment" {
  depends_on  = [aws_api_gateway_integration.event_integration]
  rest_api_id = aws_api_gateway_rest_api.slack_api.id
}

# Create a stage (the public-facing version)
resource "aws_api_gateway_stage" "dev" {
  deployment_id = aws_api_gateway_deployment.slack_api_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.slack_api.id
  stage_name    = "dev"
}

#Permissions
resource "aws_lambda_permission" "api_gateway_invoke" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = var.api_lambda_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_api_gateway_rest_api.slack_api.execution_arn}/*/*"
}

output "api_url" {
  value       = "https://${aws_api_gateway_rest_api.slack_api.id}.execute-api.us-east-1.amazonaws.com/${aws_api_gateway_stage.dev.stage_name}/event"
  description = "Invoke URL for the Slack bot API"
}


