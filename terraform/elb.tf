resource "aws_elb" "GigSky_ELB" {
  name = "GigSkyELB"
  subnets = ["${aws_subnet.GigSky_Public_1.id}", "${aws_subnet.GigSky_Public_2.id}"]
  security_groups = ["${aws_security_group.GigSky_SG.id}"]
 listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "GigSky_ELB"
  }
}

output "DNS_Name" {
	value = "${aws_elb.GigSky_ELB.dns_name}"
	}

