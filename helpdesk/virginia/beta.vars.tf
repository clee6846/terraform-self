# Virginia specific configuration
#

provider "aws" {
	region = "us-east-1"
	profile = "certain-ops-virginia"
}

variable "vpc" {
	description = "VPC name - used for tagging"
	default = "beta"
}

variable "ami" {
	type = "map"
	description = "AMIs"
	default {
		bulkapi = "ami-07e27110"
		cie = "ami-f298559f"
		evstr = "ami-f298559f"
		mgmt = "ami-4f9c0f58"
		ssomgr = "ami-f298559f"
		ssodb = "ami-f298559f"
		sso = "ami-f298559f"
		nova = "ami-f298559f"
		status = "ami-f298559f"
		test = "ami-1708f077"
	}
}

variable "availability_zones" { 
	descripton = "List of used Virginia availability zones"
	default = "us-east-1a us-east-1b"
}

variable "subnets" {
	type = "map"
	description = "Map of Virginia subnets"
	default {
		bulkapi = "subnet-4a04073c subnet-b4035fec"
		ssomgr = "subnet-4a04073c subnet-b4035fec"
		ssodb = "subnet-4a04073c subnet-b4035fec"
		sso = "subnet-4a04073c subnet-b4035fec"
		cie = "subnet-4a04073c subnet-b4035fec"
		mgmt = "subnet-4a04073c subnet-b4035fec"
		nova = "subnet-4a04073c subnet-b4035fec"
		evstr = "subnet-4a04073c subnet-b4035fec"
		status = "subnet-4a04073c subnet-b4035fec"
	}
}

variable "security_groups" {
	type = "map"
	description = "Map of Virginia security groups"
	default {
		mgmt = "sg-fba1dd80 sg-7fad4405"
		bulkapi = "sg-fba1dd80 sg-2097eb5b"
		ssomgr = "sg-fba1dd80 sg-2097eb5b"
		ssodb = "sg-fba1dd80 sg-3529514e"
		sso = "sg-fba1dd80 sg-3529514e"
		cie = "sg-fba1dd80 sg-7166410a"
		nova = "sg-fba1dd80 sg-d027e4aa"
		evstr = "sg-fba1dd80 sg-d506beaf"
		status = "sg-fba1dd80 sg-cda0ecb7"
	}
}

variable "elb_sg" {
	type = "map"
	description = "Map of ELB	security groups"
	default {
		bulkapi = "sg-debec1a5"
		evstr = "sg-4906be33"
		ssomgr = "sg-a22a52d9"
		sso = "sg-a22a52d9"
  	cie = "sg-16096471"
		nova = "sg-1e20e364"
		status = "sg-1e20e364"
	}
}

variable "pub_ip" {
	description = "Boolean to auto create a public IP"
	default = "True"
}

variable "elb_internal" {
	description = "Boolean - internal elb"
	default = "False"
}
