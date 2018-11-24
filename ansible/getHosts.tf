data "aws_instances" "Nginx_Hosts" {
        instance_tags {
                Name = "Nginx Hosts"
        }
}

output "public_ips" {
        value = "${data.aws_instances.Nginx_Hosts.public_ips}"
}


