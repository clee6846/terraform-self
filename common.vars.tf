# Common configuration
#

provider "dme" {
	akey = "f28cc5e8-07a9-422f-a75a-3305de20d862"
	skey = "6f4b8414-1ef3-46f7-abb5-ec76945bbb3e"
	usesandbox = "False"
}

variable "private_key" {
	description = "The location of the private key file"
	default = "/Users/tcouto/.ssh/certain-ops.id_rsa"
}

variable "role" {
	description = "The default role of the instance"
}

variable "environment" {
	description = "The default environment in which to start the instance"
}

variable "count" {
	description = "Number of instances to create"
	default = 1
}

variable "start_index" {
	description = "The start of the instance indexing"
	default = 101
}

variable "elb_start_index" {
	description = "The start of the elb indexing"
	default = 1
}

variable "regions" {
	description = "Map region names to short specifiers"
	type = "map"
	default { 
		oregon = "or"
		virginia = "va"
    ohio = "oh"
	}
}

variable "pod" {
	description = "The pod in which to start the instance"
	default = "general"
}

variable "shutdown" {
	description = "Default shutdown behavior"
	default = "stop"
}

variable "root_volume_delete" {
	description = "Boolean - delete root volume on instance termination"
	default = "True"
}

variable "data_volume_name" {
	description = "Default device name of the data volume"
	default = "/dev/xvdf"
}

variable "data_volume_type" {
	description = "Default storage type of the data volume"
	default = "gp2"
}

variable "data_volume_delete" {
	description = "Boolean - delete data volume on instance termination"
	default = "True"
}

variable "version" {
	description = "Version of the AMI"
	default = "latest"
}

variable "instance_record_ttl" {
	description = "Default TTL of instance A records"
	default = "1800"
}
