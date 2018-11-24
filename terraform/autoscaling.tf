resource "aws_launch_configuration" "GigSky_Launch_Config" {
	name_prefix = "GigSky_Launch_Configuration"
	image_id = "${lookup(var.AMIS, var.AWS_REGION)}"
	instance_type = "t2.micro"
	key_name = "${aws_key_pair.myKey.key_name}"
	security_groups = ["${aws_security_group.GigSky_SG.id}"]
	lifecycle {
		create_before_destroy = true
	}
}

resource "aws_autoscaling_group" "GigSky_AGS" {
  name                 = "GigSky_AGS"
  vpc_zone_identifier  = ["${aws_subnet.GigSky_Public_1.id}", "${aws_subnet.GigSky_Public_2.id}"]
  launch_configuration = "${aws_launch_configuration.GigSky_Launch_Config.name}"
  min_size             = 2
  max_size             = 4
  load_balancers = ["${aws_elb.GigSky_ELB.name}"]
  force_delete = true

  tag {
      key = "Name"
      value = "Nginx Hosts"
      propagate_at_launch = true
  }
}

