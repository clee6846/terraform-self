# Configuration for management instances
#

variable "type" {
  description = "Default instance type"
  default = "t2.micro"
}

variable "data_volume_size" {
	description = "Default size of the data volume (GB)"
	default = "5"
}
