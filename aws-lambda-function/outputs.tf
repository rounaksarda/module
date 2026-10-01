output "function_arn" {
  value = aws_lambda_function.aws_lambda_function.arn
}

output "function_name" {
  value = aws_lambda_function.aws_lambda_function.function_name
}

output "invoke_arn" {
  value = aws_lambda_function.aws_lambda_function.invoke_arn
}

output "version" {
  value = aws_lambda_function.aws_lambda_function.version
}