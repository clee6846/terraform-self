variable "lb_port" {
	type = "map"
	description = "Map of front end load balancer ports by role"
	default {
		web = ["443"]
		webhelp = ["443"]
		app = ["8009", "8080"]
		api = ["8009", "8080"]
    plat = ["9701", "8009"]
		jahia = ["8009", "8080"]
		bulkapi = ["443"]
		ssomgr = ["443"]
		sso = ["443"]
		cie = ["443"]
		evstr = ["443"]
		nova = ["443"]
		status = ["443"]
	}
}

variable "lb_protocol" {
	type = "map"
	description = "Map of front end load balancer protocols by role"
	default {
		web = ["https"]
		webhelp = ["https"]
		app = ["tcp", "http"]
		api = ["tcp", "http"]
    plat = ["http", "tcp"]
		jahia = ["tcp", "http"]
		bulkapi = ["https"]
		ssomgr = ["https"]
		sso = ["https"]
		cie = ["https"]
		evstr = ["https"]
		nova = ["https"]
		status = ["https"]
	}
}

variable "instance_port" {
	type = "map"
	description = "Map of back end load balancer ports by role"
	default {
		web = ["80"]
		webhelp = ["80"]
		app = ["8009", "8080"]
		api = ["8009", "8080"]
    plat = ["9701", "8009"]
		jahia = ["8009", "8080"]
		bulkapi = ["8080"]
		ssomgr = ["80"]
		sso = ["80"]
		cie = ["80"]
		evstr = ["8080"]
		nova = ["80"]
		status = ["80"]
	}
}

variable "instance_protocol" {
	type = "map"
	description = "Map of back end load balancer protocols by role"
	default {
		web = ["http"]
		webhelp = ["http"]
		app = ["tcp", "http"]
		api = ["tcp", "http"]
    plat = ["http", "tcp"]
		jahia = ["tcp", "http"]
		bulkapi = ["http"]
		ssomgr = ["http"]
		sso = ["http"]
		cie = ["http"]
		evstr = ["http"]
		nova = ["http"]
		status = ["http"]
	}
}

variable "health_check" {
	type = "map"
	description = "Map of instance health checks"
	default {
		web = ["TCP:80"]
		webhelp = ["HTTP:80/index.html"]
		app = ["HTTP:8080/certainApp/App/testInitialized.cfm?r123_domain=aws1"]
		api = ["HTTP:8080/certainApp/App/testInitialized.cfm?r123_domain=aws1"]
    plat = ["HTTP:9701/index.html", "HTTP:8080/certainExternal/index.html"]
		jahia = ["HTTP:8080/concierge/ping.jsp"]
		bulkapi = ["TCP:8080"]
		ssomgr = ["TCP:80"]
		sso = ["TCP:80"]
		cie = ["TCP:80"]
		evstr = ["TCP:8080"]
		nova = ["TCP:80"]
		status = ["TCP:80"]
	}
}

variable "healthy_threshold" {
	type = "map"
	description = "Instance healthy threshold"
	default = {
		webhelp = [5]
		app = [5]
		api = [5]
    plat = [5, 5]
		jahia = [5]
		status = [5]
		"*" = [2]
	}
}

variable "unhealthy_threshold" {
	type = "map"
	description = "Instance unhealthy threshold"
	default = {
		webhelp = [2]
    app = [4]
		api = [4]
    plat = [4, 4]
		jahia = [4]
		status = [2]
		"*" = [2]
	}
}

variable "interval" {
	type = "map"
	description = "Check interval in seconds"
	default = {
		webhelp = [5]
		app = [15]
		api = [15]
    plat = [15, 15]
		jahia = [15]
		status = [5]
		"*" = [30]
	}
}

variable "timeout" {
	type = "map"
	description = "Timeout period in seconds"
	default = {
		webhelp = [2]
		app = [10]
		api = [10]
    plat = [10, 10]
		jahia = [10]
		status = [2]
		"*" = [3]
	}
}

variable "elb_count" {
  type = "map"
  description = "Number of ELBs to provision"
  default = {
    plat = 2
  }
}

variable "elb_role" {
  type = "map"
  description = "Role name of ELB if provisioning multiple ELBs"
  default = {
    plat = ["int", "ext"]
  }
}

variable "cross_zone" {
	description = "Boolean - cross zone load balancing"
	default = "True"
}

variable "elb_cname_ttl" {
	description = "Time-to-live for the ELB's cname"
	default = "900"
}
