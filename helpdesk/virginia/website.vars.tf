# Virginia specific configuration
#

provider "aws" {
	region = "us-east-1"
	profile = "certain-ops-virginia"
}

variable "vpc" {
        description = "VPC name - used for tagging"
        default = "website"
}

variable "ami" {
	type = "map"
	description = "AMIs"
	default {
		webhelp = "ami-f298559f"
	}
}

variable "availability_zones" { 
	descripton = "List of used Virginia availability zones"
	default = "us-east-1a"
}

variable "subnets" {
	type = "map"
	description = "Map of Virginia subnets"
	default {
		webhelp = "subnet-70fe6b07"
	}
}

variable "security_groups" {
	type = "map"
	description = "Map of Virginia security groups"
	default {
		webhelp = "sg-bdf426d9"
	}
}

variable "elb_sg" {
	type = "map"
	description = "Map of ELB	security groups"
	default {
		webhelp = "sg-bdf426d9"
	}
}

variable "pub_ip" {
	description = "Boolean to auto create a public IP"
	default = "True"
}

variable "elb_internal" {
	default = "false"
}
