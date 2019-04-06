output "instance_public_dns" {
  value = "${module.aws_waf.instance_public_dns}"
}

output "lb_dns_name" {
  value = "${module.aws_waf.lb_dns_name}"
}
