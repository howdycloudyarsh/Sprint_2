# print the url of the jenkins server

output "website_url" {
  value = "http://${module.ec2_instance.public_ip}:${8080}"
}