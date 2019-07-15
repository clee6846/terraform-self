resource "dme_record" "record" {
	type = "CNAME"
	name = "${var.cname}"
	value = "${aws_elb.elb.dns_name}."
	domainid = "${var.domainid}"
	ttl = "${var.ttl}"
}
