variable bucket_name { 
	description = "The bucket name"
}

variable bucket_base_name {
	description = "The base name for s3 buckets"
	default = "certain.com"
}

variable bucket_acl { 
	description = "The ACL for the bucket"
	default = "private"
}

variable bucket_lifecycle_prefix {
	description = "The prefix to which the bucket lifecycle applies"
	default = "/"
}

variable bucket_lifecycle_enabled {
	description = "Boolean - Enable the lifecycle policy"
	default = "True"
}

variable bucket_expiration {
	description = "Number of days after before items in the bucket are deleted"
	default = "7"
}
