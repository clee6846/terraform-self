resource "aws_elb" "elb" {
  count = "${lookup(var.elb_count, var.role)}"
  name = "${format("elb-%s-%s-%s-%s", (var.elb_count[var.role] + 0) > 1 ? element(var.elb_role[var.role], count.index) : var.role, var.pod, var.environment, lookup(var.regions, var.region))}"
  subnets = ["${split(" ", lookup(var.subnets, var.role))}"]
  security_groups = ["${element(var.elb_sg[format("%s.%s", var.role, var.pod)], count.index)}"]
  internal = "${var.elb_internal}"
  listener {
    lb_port = "${element(var.lb_port[var.role], count.index)}"
    lb_protocol = "${element(var.lb_protocol[var.role], count.index)}"
    instance_port = "${element(var.instance_port[var.role], count.index)}"
    instance_protocol = "${element(var.instance_protocol[var.role], count.index)}"
    ssl_certificate_id = "${element(var.ssl_cert[var.role], count.index)}"
  }
  health_check {
    healthy_threshold = "${element(var.healthy_threshold[var.role], count.index)}"
    unhealthy_threshold = "${element(var.unhealthy_threshold[var.role], count.index)}"
    interval = "${element(var.interval[var.role], count.index)}"
    timeout = "${element(var.timeout[var.role], count.index)}"
    target = "${element(var.health_check[var.role], count.index)}"
  }
  cross_zone_load_balancing = "${var.cross_zone}"
  instances = ["${aws_instance.instance.*.id}"]
  tags {
    Name = "${format("elb-%s-%s-%s-%s", (var.elb_count[var.role] + 0) > 1 ? element(var.elb_role[var.role], count.index) : var.role, var.pod, var.environment, lookup(var.regions, var.region))}"
    Role = "${var.role}"
    Pod = "${var.pod}"
    Environment = "${var.environment}"
    Region = "${var.region}"
    VPC = "${var.vpc}"
  }
}

resource "aws_route53_record" "route53_cname" {
  count = "${lookup(var.elb_count, var.role)}"
  zone_id = "${var.route53_zone_id}"
  type = "CNAME"
  name = "${format("elb.%s.%s.%s.%s.certainaws.com", (var.elb_count[var.role] + 0) > 1 ? element(var.elb_role[var.role], count.index) : var.role, var.pod, var.environment, lookup(var.regions, var.region))}"
  records = ["${element(aws_elb.elb.*.dns_name, count.index)}"]
  ttl = "${var.elb_cname_ttl}"
}
