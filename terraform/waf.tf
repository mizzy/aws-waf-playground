module "aws_waf" {
  source          = "./module/aws_waf"
  key_name        = "aws_mizzy"
  vpc_id          = "vpc-b3d130db"
  subnets         = ["subnet-b4d130dc", "subnet-b5d130dd"]
  security_groups = ["default"]
}

resource "aws_wafregional_web_acl" "waf_test" {
  name        = "waf-test"
  metric_name = "WafTest"

  default_action {
    type = "ALLOW"
  }

  rule {
    override_action {
      type = "NONE"
    }

    type     = "GROUP"
    priority = 1
    rule_id  = "7db80e57-8bc7-4c5a-929e-c3a1fa12e8e0"
  }
}

resource "aws_wafregional_web_acl_association" "waf_test" {
  resource_arn = "${module.aws_waf.aws_lb-waf_test-arn}"
  web_acl_id   = "${aws_wafregional_web_acl.waf_test.id}"
}
