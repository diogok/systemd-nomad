# Systemd Hashcorp Nomad

Scripts and config to provision Hashistack on systemd systems.

Includes:

- docker
- cni plugins
- consul
- nomad

It can be used as a reference, as a terraform module (maybe...) or to generate and use cloud-init using terraform.

To do:

- vault

## Cloud-init

### Testing local

You can test using [multipass](https://multipass.run/) and [terraform]().

To launch manager:

```
make launch-manager
```

To launch client:

```
make launch-client
```

To see IPs and machines

```
make list
```

## Scripts and services

### Dependencies

On the machines you will need

- curl
- unzip
- sudo

Also, run with non root.

### Usage

Copy all services to /etc/ops.

Fill in "env" file and copy to /etc/ops.

Run all scripts in order.

### Configuration

"Env" variables:

| var | description | default |
| --- | ----------- | --- |
| DC | dacenter name to set on consul and nomad | dc1 |
| INDEX | Number of this machine on provisioning (the first machine is special) | 0 |
| MANAGER_COUNT | How many manager servers to expect for bootstrap | 1 |
| ENCKEY | Encryption key for consul network | |
| IFACE | Network interface to bind (eth0, ensp0s1,wlan0) | eth0 |
| ROLE | If this will be a manager or worker | manager |
| SEED | Server to connect cluster first (if not first noed) | localhost |

### More information

- We setup max_map_count and max open files (fs.file-max)
- We create a docker network called just `network`
- The docker internal network  will be 10.2.2.0/24
- The docker network will have host exposed to the containers at 10.2.2.1
- It is important to setup INDEX env var specially at zero for first deployment
- You can run the provision scripts anytime, it detects if it was already run and exit properly 
- Scripts try to detect architecture (arm, x86_64, darwin)
- Connect is enabled on consul
- The machine default DNS is set as rescursive DNS on consul
- Nomad has prometheus metrics endpoint enabled
- Nomad have docker privilieged and raw exec enabled
- Nomad is connect enabled

## License

MIT

