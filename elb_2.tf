resource "aws_elb" "elb" {
  name = "${format("elb-%s-%s-%s-%s", var.role, var.pod, var.environment, lookup(var.regions, var.region))}"
  subnets = ["${split(" ", lookup(var.subnets, var.role))}"]
  security_groups = ["${element(var.elb_sg[format("%s.%s", var.role, var.pod)], 1)}"]
  internal = "${var.elb_internal}"
  listener {
    lb_port = "${element(var.lb_port[var.role], 1)}"
    lb_protocol = "${element(var.lb_protocol[var.role], 1)}"
    instance_port = "${element(var.instance_port[var.role], 1)}"
    instance_protocol = "${element(var.instance_protocol[var.role], 1)}"
    ssl_certificate_id = "${element(var.ssl_cert[var.role], 1)}"
  }
  listener {
    lb_port = "${element(var.lb_port[var.role], 2)}"
    lb_protocol = "${element(var.lb_protocol[var.role], 2)}"
    instance_port = "${element(var.instance_port[var.role], 2)}"
    instance_protocol = "${element(var.instance_protocol[var.role], 2)}"
    ssl_certificate_id = "${element(var.ssl_cert[var.role], 2)}"
  }
  health_check {
    healthy_threshold = "${element(var.healthy_threshold[var.role], 1)}"
    unhealthy_threshold = "${element(var.unhealthy_threshold[var.role], 1)}"
    interval = "${element(var.interval[var.role], 1)}"
    timeout = "${element(var.timeout[var.role], 1)}"
    target = "${element(var.health_check[var.role], 1)}"
  }
  cross_zone_load_balancing = "${var.cross_zone}"
  instances = ["${aws_instance.instance.*.id}"]
  tags {
    Name = "${format("elb-%s-%s-%s-%s", var.role, var.pod, var.environment, lookup(var.regions, var.region))}"
    Role = "${var.role}"
    Pod = "${var.pod}"
    Environment = "${var.environment}"
    Region = "${var.region}"
    VPC = "${var.vpc}"
  }
}

resource "aws_route53_record" "route53_cname" {
  zone_id = "${var.route53_zone_id}"
  type = "CNAME"
  name = "${format("elb.%s.%s.%s.%s.certainaws.com", var.role, var.pod, var.environment, lookup(var.regions, var.region))}"
  records = ["${aws_elb.elb.dns_name}"]
  ttl = "${var.elb_cname_ttl}"
}
