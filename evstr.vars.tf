# Configuration for EventStream instances
#

variable "type" {
  description = "Default instance type"
  default = "m4.2xlarge"
}

variable "data_volume_size" {
	description = "Default size of the data volume (GB)"
	default = "20"
}
