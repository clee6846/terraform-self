# Configuration for test instances in Oregon
#

variable "type" {
  description = "Default instance type"
  default = "t2.medium"
}

variable "data_volume_size" {
	description = "Default size of the data volume (GB)"
	default = "10"
}
