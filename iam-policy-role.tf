resource "aws_iam_policy" "policy-start-stop-ec2" { 
    name         = "ploicy-start-stop-ec2"
    path         = "/"
    description  = "Policy for Lambda function to control start and stop of EC2 instances"
    policy       = "${file("policy.json")}"
}
resource "aws_iam_role" "role-start-stop-ec2" {
    name        = "role-start-stop-ec2"
    path        = "/"
    description = "Allows Lambda function to control start and stop of EC2 instances."
    assume_role_policy = "${file("role.json")}"
}
resource "aws_iam_policy_attachment" "attach_iam_policy_to_iam_role" {
    name       = "attach_iam_policy_to_iam_role"
    roles      = ["${aws_iam_role.role-start-stop-ec2.name}"]
    policy_arn = "${aws_iam_policy.policy-start-stop-ec2.arn}"
}