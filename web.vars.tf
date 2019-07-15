# Configuration for management instances
#

variable "type" {
  description = "Default instance type"
  default = "c4.xlarge"
}

variable "data_volume_size" {
	description = "Default size of the data volume (GB)"
	default = "30"
}
