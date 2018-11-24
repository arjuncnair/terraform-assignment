resource "aws_vpc" "GigSky_VPC" {
	cidr_block = "10.0.0.0/16"
	instance_tenancy = "default"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
	enable_classiclink = "false"
	tags {
		Name = "GigSky_VPC"
	}
}

resource "aws_subnet" "GigSky_Public_1" {
	vpc_id = "${aws_vpc.GigSky_VPC.id}"
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "eu-west-2a"
	tags {
		Name = "GigSky_Public_Subnet_1"
	}
}

resource "aws_subnet" "GigSky_Public_2" {
	vpc_id ="${aws_vpc.GigSky_VPC.id}"
	cidr_block = "10.0.2.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "eu-west-2b"
	tags {
		Name = "GigSky_Public_Subnet_2"
	}
}

resource "aws_subnet" "GigSky_Privae_1" {
	vpc_id = "${aws_vpc.GigSky_VPC.id}"
	cidr_block = "10.0.3.0/24"
	map_public_ip_on_launch = "false"
	availability_zone = "eu-west-2a"
	tags {
		Name = "GigSky_Private_Subnet_1"
	}	
}

resource "aws_subnet" "GigSky_Private_2" {
	vpc_id = "${aws_vpc.GigSky_VPC.id}"
	cidr_block = "10.0.4.0/24"
	map_public_ip_on_launch = "false"
	availability_zone = "eu-west-2b"
	tags {
		Name = "GigSky_Private_Subnet_2"
	}
}

resource "aws_internet_gateway" "GigSky_IG" {
	vpc_id = "${aws_vpc.GigSky_VPC.id}"
	tags {
		Name = "GigSky_InternetGateway"
	}
}

resource "aws_route_table" "GigSky_RT_Public" {
	vpc_id = "${aws_vpc.GigSky_VPC.id}"
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.GigSky_IG.id}"
	}
	tags {
		Name = "GigSky_RT_Public"
	}
}

resource "aws_route_table_association" "GigSky_Public-1a" {
	subnet_id = "${aws_subnet.GigSky_Public_1.id}"
	route_table_id = "${aws_route_table.GigSky_RT_Public.id}"
}

resource "aws_route_table_association" "GigSky_Public-1b" {
	subnet_id = "${aws_subnet.GigSky_Public_2.id}"
	route_table_id = "${aws_route_table.GigSky_RT_Public.id}"
}
