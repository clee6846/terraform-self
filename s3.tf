resource "aws_s3_bucket" "bucket" {
	bucket = "${format("%s.%s", var.bucket_name, var.bucket_base_name)}"
	acl = "${var.bucket_acl}"
	lifecycle_rule {
		prefix = "${var.bucket_lifecycle_prefix}"
		enabled = "${var.bucket_lifecycle_enabled}"
		expiration {
			days = "${var.bucket_expiration}"
		}
	}
	tags {
		Name = "${format("%s.%s", var.bucket_name, var.bucket_base_name)}"
		Environment = "${var.environment}"
	}
}
