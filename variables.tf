
variable "join" {
	default="127.0.0.1"
}

variable "manager" {
	default=false
}

variable "manager_bootstrap" {
	default=false
}

variable "manager_count" {
	default=1
}

variable "datacenter" {
	default="dc1"
}

variable "architecture" {
	default="amd64"
}

variable "consul_version" {
	default="1.7.2"
}

variable "nomad_version" {
	default="0.10.4"
}

variable "encryption_key" {
	default="Luj2FZWwlt8475wD1WtwUQ=="
}
