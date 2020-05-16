
variable "join" {
	default="127.0.0.1"
	description="Node to join ip/address the cluster. For first node can be 127.0.0.1. For cloud can use cloud auto-join strings."
}

variable "server" {
	default=false
	description="If this cloud-init is for a server (true) or client (false)"
}

variable "server_bootstrap" {
	default=false
	description="If this is a server, should we bootstrap the cluster? Generally on needed on one node."
}

variable "server_count" {
	default=1
	description="How many servers are expected? Used on server bootsrap."
}

variable "datacenter" {
	default="dc1"
	description="Datacenter name for consul and nomad"
}

variable "architecture" {
	default="amd64"
	description="Machine architecture, to download correct binaries"
}

variable "consul_version" {
	default="1.7.2"
	description="Consul version"
}

variable "nomad_version" {
	default="0.10.4"
	description="Nomad version"
}

variable "encryption_key" {
	default="Luj2FZWwlt8475wD1WtwUQ=="
	description="Consul internal comunication encryption key"
}

variable "volumes" {
	default=[]
	type=list(string)
	description="If we need to create nomad volumes on this host. Is a list of 'path0,path1,path2'. This will be created at /opt/data/$path0 and exposed on nomad with $path0 name."
}

variable "metadata" {
  default={}
  type=map
  description="Metadata on nomad instances"
}

