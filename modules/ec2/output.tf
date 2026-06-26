output "instance_ids" {

  value = { for id, instance in aws_instance.example : id => instance.id }


}

output "instance_private_ip" {
  value = { for ip, instance in aws_instance.example : ip => instance.private_ip }
}
