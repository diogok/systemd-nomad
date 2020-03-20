
data "template_file" "cloud-init" {
  template = "${file("${path.module}/cloud-init.tpl.yml")}"

  vars = {
		manager=var.manager
		manager_count=var.manager_count
		manager_bootstrap=var.manager_bootstrap
		join=var.join
		datacenter=var.datacenter
		encryption_key=var.encryption_key
		nomad_version=var.nomad_version
		consul_version=var.consul_version
		architecture=var.architecture
		volumes=join(",",var.volumes)
  }
}

