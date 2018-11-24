variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
	default = "eu-west-2"
}
variable "AMIS" {
	type = "map"
	default = {
		eu-west-1 = "ami-0773391ae604c49a4"
		eu-west-2 = "ami-0b0a60c0a2bd40612"
		eu-west-3 = "ami-075b44448d2276521"
	}
}
variable "PUBLIC_KEY_PATH" {
	default = "myKey.pub"
}
variable "PRIVATE_KEY_PATH" {
	default = "myKey"
}
variable "INSTANCE_USERNAME" {
	default = "ubuntu"
}
