//data "archive_file" "zip_the_python_code" {
    //type        = "zip"
    //source_dir  = "${path.module}/final/"
    //output_path = "${path.module}/final/ec2_start_stop.zip"
//}
resource "aws_lambda_function" "lambda-start-stop-ec2" {
    filename                       = "ec2_start_stop.zip"
    function_name                  = "lambda-start-stop-ec2"
    role                           = aws_iam_role.role-start-stop-ec2.arn
    handler                        = "ec2_start_stop.lambda_handler"
    runtime                        = "python3.9"
}