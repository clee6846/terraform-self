variable "ssl_cert" {
	type = "map"
	description = "SSL certificate"
	default {
		api = [""]
    app = [""]
    plat = [""]
		jahia = [""]
		bulkapi = [""]
		ssomgr = [""]
		cie = [""]
		evstr = [""]
	}
}

variable "route53_zone_id" {
	description = "Zone ID for route53"
	default = "/hostedzone/ZAPSJK0Z6EHKB"
}
