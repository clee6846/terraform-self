# Configuration for SSO DB instances
#

variable "type" {
  description = "Default instance type"
  default = "c3.4xlarge"
}

variable "data_volume_size" {
	description = "Default size of the data volume (GB)"
	default = "80"
}
