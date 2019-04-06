output "instance_public_dns" {
  value = "${aws_instance.waf_test.public_dns}"
}

output "lb_dns_name" {
  value = "${aws_lb.waf_test.dns_name}"
}
