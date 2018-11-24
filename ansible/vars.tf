variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
	default = "eu-west-2"
}
variable "AMIS" {
	type = "map"
	default = {
		eu-west-1 = "ami-00035f41c82244dab"
		eu-west-2 = "ami-0b0a60c0a2bd40612"
		eu-west-3 = "ami-08182c55a1c188dee"
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
