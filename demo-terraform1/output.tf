output "instance_ip" {
  value = "${aws_instance.juancsr-instance.*.public_ip}"
}