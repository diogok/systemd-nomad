
data "template_file" "cloud-init" {
  template = "${file("${path.module}/cloud-init.tpl.yml")}"

  vars = {
		server=var.server
		server_count=var.server_count
		server_bootstrap=var.server_bootstrap
		join=var.join
		datacenter=var.datacenter
		encryption_key=var.encryption_key
		nomad_version=var.nomad_version
		consul_version=var.consul_version
		architecture=var.architecture
		volumes=join(",",var.volumes)
  }
}

