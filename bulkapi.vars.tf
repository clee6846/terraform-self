# Configuration for Bulk API instances in Oregon
#

variable "type" {
  description = "Default instance type for Bulk API instances"
  default = "m4.xlarge"
}

variable "data_volume_size" {
	description = "Default size of the data volume (GB)"
	default = "128"
}
