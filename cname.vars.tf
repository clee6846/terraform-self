variable "cname" {
	description = "CNAME record"
}

/*
variable "a_record" {
	description = "A record to which the CNAME points"
}
*/

variable "domainid" {
	description = "The domain id to use"
	default = "532833" # certain.com
}

variable "ttl" {
	description = "Time to Live of the CNAME" 
	default = 3600
}
