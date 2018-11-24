resource "aws_security_group" "GigSky_SG" {
	name = "SSH"
	description = "Allow SSH Connection!"
	vpc_id = "${aws_vpc.GigSky_VPC.id}"
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags {
		Name = "GigSky_Security_Group"
	}	
}
