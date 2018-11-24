resource "aws_key_pair" "myKey" {
        key_name = "myKey"
        public_key = "${file("${var.PUBLIC_KEY_PATH}")}"
	lifecycle {
		ignore_changes = ["public_key"]
  	}
}

