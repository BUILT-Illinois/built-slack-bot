module "api_gateway" {
    source          = "./modules/api_gateway"
    api_lambda_arn  = module.lambda_function.lambda_arn
    api_lambda_name = module.lambda_function.lambda_name
    aws_region      = var.aws_region
    }