# Oregon specific configuration for Dev VPC
#

provider "aws" {
  region = "us-east-1"
  profile = "prod"
}

variable "vpc" {
  description = "VPC name - used for tagging"
  default = "Production"
}

variable "ami" {
	type = "map"
	description = "AMIs"
	default {
		mgmt  = "ami-38e7182e"
		web   = "ami-38e7182e"
		app   = "ami-38e7182e"
		api   = "ami-38e7182e"
		int   = "ami-38e7182e"
		ext   = "ami-38e7182e"
		plat  = "ami-38e7182e"
		jahia = "ami-38e7182e"
		jprox = "ami-38e7182e"
		ame   = "ami-38e7182e"
		"*"   = "ami-38e7182e"
	}
}

variable "availability_zones" { 
  description = "List of used availability zones"
  default = "us-east-1a us-east-1b"
}

variable "subnets" {
  type = "map"
  description = "Map of subnets"
  default {
    mgmt    = "subnet-c2fc00ef subnet-bc53fff5"
    web     = "subnet-c6fc00eb subnet-bf53fff6"
    app     = "subnet-dcfc00f1 subnet-bb53fff2"
    api     = "subnet-dcfc00f1 subnet-bb53fff2"
    plat    = "subnet-dcfc00f1 subnet-bb53fff2"
    jahia   = "subnet-dcfc00f1 subnet-bb53fff2"
    ame     = "subnet-dcfc00f1 subnet-bb53fff2"
    jprox   = "subnet-dcfc00f1 subnet-bb53fff2"
    bulkapi = "subnet-dcfc00f1 subnet-bb53fff2"
    ssomgr  = "subnet-dcfc00f1 subnet-bb53fff2"
    ssodb   = "subnet-dcfc00f1 subnet-bb53fff2"
    int     = "subnet-dcfc00f1 subnet-bb53fff2"
    ext     = "subnet-dcfc00f1 subnet-bb53fff2"
    test    = "subnet-dcfc00f1 subnet-bb53fff2"
  }
}

variable "security_groups" {
  type = "map"
  description = "Default security groups"
  default {
    mgmt.pod1   = "sg-c4a9e5be sg-c5a9e5bf"
    web.pod1    = "sg-c4a9e5be sg-bba9e5c1"

    app.pod0    = "sg-c4a9e5be sg-b8a9e5c2 sg-4f2a3332"
    api.pod0    = "sg-c4a9e5be sg-b8a9e5c2 sg-4f2a3332"
    plat.pod0   = "sg-c4a9e5be sg-b8a9e5c2 sg-55c1d528 sg-9bc0d4e6"

    app.pod1    = "sg-c4a9e5be sg-b8a9e5c2 sg-8ea9e5f4"
    api.pod1    = "sg-c4a9e5be sg-b8a9e5c2 sg-8ea9e5f4"
    plat.pod1   = "sg-c4a9e5be sg-b8a9e5c2 sg-48aae632 sg-95a9e5ef"
    jahia.pod1  = "sg-c4a9e5be sg-b8a9e5c2 sg-97a9e5ed"
    ame.pod1    = "sg-c4a9e5be sg-b8a9e5c2 sg-96a9e5ec"
    jprox.pod1  = "sg-c4a9e5be sg-b8a9e5c2 sg-01b60f7c"

    app.pod2    = "sg-c4a9e5be sg-b8a9e5c2 sg-b37b9acf"
    plat.pod2   = "sg-c4a9e5be sg-b8a9e5c2 sg-077b9a7b sg-4e7b9a32"
    jahia.pod2  = "sg-c4a9e5be sg-b8a9e5c2 sg-457b9a39"
    ame.pod2    = "sg-c4a9e5be sg-b8a9e5c2 sg-487b9a34"

    app.pod3    = "sg-c4a9e5be sg-b8a9e5c2 sg-eeb85892"
    api.pod3    = "sg-c4a9e5be sg-b8a9e5c2 sg-eeb85892"
    plat.pod3   = "sg-c4a9e5be sg-b8a9e5c2 sg-51b8582d sg-a8b757d4"
    ame.pod3    = "sg-c4a9e5be sg-b8a9e5c2 sg-b3b757cf"

    app.pod4    = "sg-c4a9e5be sg-b8a9e5c2 sg-ffb85883"
    plat.pod4   = "sg-c4a9e5be sg-b8a9e5c2 sg-50b8582c sg-a9b757d5"
    jahia.pod4  = "sg-c4a9e5be sg-b8a9e5c2 sg-a4b757d8"
    ame.pod4    = "sg-c4a9e5be sg-b8a9e5c2 sg-eab95996"

    app.pod5    = "sg-c4a9e5be sg-b8a9e5c2 sg-dfb858a3"
    plat.pod5   = "sg-c4a9e5be sg-b8a9e5c2 sg-3cb85840 sg-89b757f5"

    app.pod6    = "sg-c4a9e5be sg-b8a9e5c2 sg-e7b8589b"
    plat.pod6   = "sg-c4a9e5be sg-b8a9e5c2 sg-49b85835 sg-abb757d7"
    ame.pod6    = "sg-c4a9e5be sg-b8a9e5c2 sg-a6b757da"
 
    app.pod7    = "sg-c4a9e5be sg-b8a9e5c2 sg-e2b8589e"
    plat.pod7   = "sg-c4a9e5be sg-b8a9e5c2 sg-46b8583a sg-aeb757d2"
    ame.pod7    = "sg-c4a9e5be sg-b8a9e5c2 sg-adb757d1"
  }
}

variable "elb_sg" {
  type = "map"
  description = "Map of ELB  security groups"
  default {
    app.pod0   = ["sg-4f2a3332"]
    api.pod0   = ["sg-4f2a3332"]
    plat.pod0  = ["sg-55c1d528", "sg-9bc0d4e6"]

    app.pod1   = ["sg-8ea9e5f4"]
    api.pod1   = ["sg-8ea9e5f4"]
    int.pod1   = ["sg-48aae632"]
    ext.pod1   = ["sg-95a9e5ef"]
    jahia.pod1 = ["sg-97a9e5ed"]
    ame.pod1   = ["sg-96a9e5ec"]
    plat.pod1  = ["sg-48aae632", "sg-95a9e5ef"]

    app.pod2   = ["sg-b37b9acf"]
    plat.pod2  = ["sg-077b9a7b", "sg-4e7b9a32"]

    app.pod3   = ["sg-eeb85892"]
    api.pod3   = ["sg-eeb85892"]
    plat.pod3  = ["sg-51b8582d", "sg-a8b757d4"]

    app.pod4   = ["sg-ffb85883"]
    plat.pod4  = ["sg-50b8582c", "sg-a9b757d5"]

    app.pod5   = ["sg-dfb858a3"]
    plat.pod5  = ["sg-3cb85840", "sg-89b757f5"]

    app.pod6   = ["sg-e7b8589b"]
    plat.pod6  = ["sg-49b85835", "sg-abb757d7"]

    app.pod7   = ["sg-e2b8589e"]
    plat.pod7  = ["sg-46b8583a", "sg-aeb757d2"]
  }
}

variable "elb_internal" {
  description = "Boolean - internal elb"
  default = "True"
}

variable "pub_ip" {
  description = "Boolean to auto create a public IP"
  default = "False"
}
