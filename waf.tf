module "aws_waf" {
  source          = "./module/aws_waf"
  key_name        = "aws_mizzy"
  vpc_id          = "vpc-b3d130db"
  subnets         = ["subnet-b4d130dc", "subnet-b5d130dd"]
  security_groups = ["default"]
}
