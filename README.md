# Systemd Hashcorp Nomad

Scripts and config to provision Hashistack on systemd systems using cloud-init.

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

You can test using [multipass](https://multipass.run/) and [terraform](https://www.terraform.io/).

To launch manager:

```
make launch-manager
```

To launch client:

```
make launch-client
```

To see IPs and machines:

```
make list
```

## More information

- We setup max_map_count and max open files (fs.file-max)
- We create a docker network called just `network`
- The docker internal network  will be 10.2.2.0/24
- The docker network will have host exposed to the containers at 10.2.2.1
- Connect is enabled on consul
- The machine default DNS is set as rescursive DNS on consul
- Nomad has prometheus metrics endpoint enabled
- Nomad have docker privilieged and raw exec enabled
- Nomad is connect enabled
- Set client or server vars accordingly
- Set bootstrap_expect var only on first manager
- It is all managed on systemd
- Use "join" var to set a seed node ip or cloud auto join string

## License

MIT

