# Template for AWS instances
#

resource "aws_instance" "instance" {
  count = "${var.count}"
  ami = "${lookup(var.ami, var.role)}"
  instance_type = "${var.type}"
  subnet_id = "${element(split(" ", lookup(var.subnets, var.role)), (var.start_index + count.index) % length(var.subnets))}"
  vpc_security_group_ids = ["${split(" ", lookup(var.security_groups, format("%s.%s", var.role, var.pod)))}"]
  associate_public_ip_address = "${var.pub_ip}"
  instance_initiated_shutdown_behavior = "${var.shutdown}"
  root_block_device {
    delete_on_termination = "${var.root_volume_delete}"
  }
  ebs_block_device {
    device_name = "${var.data_volume_name}"
    volume_type = "${var.data_volume_type}"
    volume_size = "${var.data_volume_size}"
    delete_on_termination = "${var.data_volume_delete}"
  }
  tags {
    Name = "${format("%s%03d.%s.%s.%s.certainaws.com", var.role, (count.index + var.start_index), var.pod, var.environment, lookup(var.regions, var.region))}"
    Role = "${var.role}"
    Pod = "${var.pod}"
    Environment = "${var.environment}"
    Region = "${var.region}"
    VPC = "${var.vpc}"
  }
  lifecycle {
    ignore_changes = ["tags", "ami"]
  }
  connection {
    "user" = "certain-ops"
    "private_key" = "${file("${var.private_key}")}"
    "agent" = "false"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo hostnamectl set-hostname ${format("%s%03d.%s.%s.%s.certainaws.com", var.role, (count.index + var.start_index), var.pod, var.environment, lookup(var.regions, var.region))}",
      "hostname | sudo tee /etc/salt/minion_id > /dev/null",
      "sudo mkdir /data02",
      "sudo mkfs.xfs /dev/xvdf",
      "echo '/dev/xvdf       /data02 xfs     defaults        0       2' | sudo tee --append /etc/fstab > /dev/null",
      "sudo mount -a",
      "sudo systemctl restart network",
      "echo 'file_client: remote' | sudo tee --append /etc/salt/minion",
      "echo 'master:' | sudo tee --append /etc/salt/minion",
      "echo '  - ${format("mgmt101.pod1.%s.%s.certainaws.com", var.environment, lookup(var.regions, var.region))}' | sudo tee --append /etc/salt/minion",
      "sudo systemctl restart salt-minion", 
      "sudo salt-call state.highstate"
    ]
  }
}

resource "aws_route53_record" "route53_a_record" {
  count = "${var.count}"
  zone_id = "${var.route53_zone_id}"
  type = "A"
  name = "${format("%s%03d.%s.%s.%s.certainaws.com", var.role, (count.index + var.start_index), var.pod, var.environment, lookup(var.regions, var.region))}"
  records = ["${element(aws_instance.instance.*.private_ip, count.index)}"]
  ttl = "${var.instance_record_ttl}"
}
