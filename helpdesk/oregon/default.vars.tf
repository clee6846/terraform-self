# Configuration for the default VPC in Oregon
#

provider "aws" {
	region = "us-west-2"
	profile = "certain-ops-oregon"
}

variable "vpc" {
	description = "VPC name - used for tagging"
	default = "POC"
}

variable "ami" {
	type = "map"
	description = "AMIs"
	default {
		bulkapi = "ami-a33cc4c3"
		evstr = "ami-1708f077"
		mgmt = "ami-c9c20ba9"
		novaqa = "ami-c9c20ba9"
		ssodb = "ami-1708f077"
		ssomgr = "ami-1708f077"
		sso = "ami-1708f077"
		test = "ami-1708f077"
	}
}

variable "availability_zones" { 
	descripton = "List of used Oregon availability zones"
	default = "us-west-2a us-west-2b"
}

variable "subnets" {
	type = "map"
	description = "Map of oregon subnets"
	default {
		web = "subnet-000000, subnet-000001"
		bulkapi = "subnet-3d814859 subnet-8f00daf9"
		sso = "subnet-3d814859 subnet-8f00daf9"
		ssomgr = "subnet-3d814859 subnet-8f00daf9"
		ssodb = "subnet-3d814859 subnet-8f00daf9"
		test = "subnet-3d814859 subnet-8f00daf9"
		mgmt = "subnet-3d814859 subnet-8f00daf9"
		evstr = "subnet-3d814859 subnet-8f00daf9"
		novaqa = "subnet-3d814859 subnet-8f00daf9"
	}
}

variable "security_groups" {
	type = "map"
	description = "Map of Oregon security groups"
	default {
		bulkapi = "sg-16096471"
		evstr = "sg-16096471"
		mgmt = "sg-16096471"
		sso = "sg-16096471"
		ssodb = "sg-16096471"
		ssomgr = "sg-16096471"
		novaqa = "sg-16096471"
		default = "sg-16096471 sg-5ebac038"
	}
}

variable "elb_sg" {
	type = "map"
	description = "Map of ELB	security groups"
	default {
		bulkapi = "sg-16096471"
		evstr = "sg-16096471"
		ssomgr = "sg-16096471"
		sso = "sg-16096471"
	}
}

variable "pub_ip" {
	description = "Boolean to auto create a public IP"
	default = "True"
}
