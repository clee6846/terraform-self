# Configuration for nova instances
# This is a custom project for Voya and Reed spearheaded by Gwendal and Leila
# See more details on SA-14903
#

variable "type" {
  description = "Default instance type for Bulk API instances"
  default = "c4.xlarge"
}

variable "data_volume_size" {
	description = "Default size of the data volume (GB)"
	default = "30"
}
