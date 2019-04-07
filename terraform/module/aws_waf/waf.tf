resource "aws_instance" "waf_test" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_name}"
  security_groups = ["default"]

  tags {
    Name = "waf-test"
  }
}

resource "aws_lb" "waf_test" {
  subnets = "${var.subnets}"
}

resource "aws_lb_listener" "waf_test" {
  port              = 80
  load_balancer_arn = "${aws_lb.waf_test.arn}"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.waf_test.arn}"
  }
}

resource "aws_lb_target_group" "waf_test" {
  name        = "waf-test"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = "${var.vpc_id}"
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "waf_test" {
  target_group_arn = "${aws_lb_target_group.waf_test.arn}"
  target_id        = "${aws_instance.waf_test.id}"
}
