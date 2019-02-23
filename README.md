# Systemd Hashcorp Nomad

Scripts and config to provision Hashistack on systemd systems.

Includes:

- docker
- weave
- consul
- nomad

To do:

- vault

## Dependencies

On the machines you will need

- curl
- unzip
- sudo

Also, run with non root.

## Usage

Copy all services to /etc/ops.

Fill in "env" file and copy to /etc/ops.

Run all scripts in order.

## Configuration

"Env" variables:

| var | description | default |
| --- | ----------- | --- |
| DC | dacenter name to set on consul and nomad | dc1 |
| WEAVE | If we should setup weave or not | yes |
| WEAVE_ENC | If we should enable encryption on weave (impacts performance) | no |
| INDEX | Number of this machine on provisioning (the first machine is special) | 0 |
| MANAGER_COUNT | How many manager servers to expect for bootstrap | 1 |
| ENCKEY | Encryption key for weave, if setup | |
| IFACE | Network interface to bind (eth0, ensp0s1,wlan0) | eth0 |
| ROLE | If this will be a manager or worker | manager |
| SEED | Server to connect cluster first (if not first noed) | localhost |
| START | If we should start server right away | yes |

## More information

- We setup max_map_count and max open files (fs.file-max)
- If we don't setup weave, we create a docker network called just `network`
- The docker internal network or weave will be 10.2.2.0/24
- The docker network or weave will have host exposed to the containers at 10.2.2.1
- The weave network will have host exposed also at host.weave.local
- It is important to setup INDEX env var specially at zero for first deployment
- You can run the provision scripts anytime, it detects if it was already and run and exit properly 
- Scripts try to detect architecture (arm, x86_64, darwin)
- Connect is enabled on consul
- The machine default DNS is set as rescursive DNS on consul
- Nomad has prometheus metrics endpoint enabled
- Nomad have docker privilieged and raw exec enabled

## License

MIT

