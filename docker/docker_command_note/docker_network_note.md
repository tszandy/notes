# Docker Networks Overview

Docker networks define how containers communicate with each other and with external systems. They control connectivity, hostname resolution, and traffic isolation.

## Network Types

| Network Type      | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| `bridge`          | Default for standalone containers. Private internal network for communication. |
| `host`            | Shares the host’s network namespace. No isolation. Linux-only.             |
| `none`            | Disables all networking for the container.                                 |
| `overlay`         | Enables communication across Docker Swarm nodes.                           |
| `macvlan`         | Assigns a MAC address; container appears on the physical network.          |
| **Custom bridge** | Used in Compose; allows DNS-based service discovery between containers.     |

## Example: Create and Use a Network Manually

```bash
docker network create my-net
docker run -d --network my-net --name app1 nginx
docker run -it --network my-net alpine ping app1
```


# Docker Network Command Reference

## `docker network connect`
Connect a container to a network.

| Option | Description |
|--------|-------------|
| `--alias strings` | Add network-scoped alias for the container |
| `--driver-opt strings` | Driver options for the network |
| `--ip string` | IPv4 address (e.g., `172.30.100.104`) |
| `--ip6 string` | IPv6 address (e.g., `2001:db8::33`) |
| `--link list` | Add link to another container |
| `--link-local-ip strings` | Add a link-local address for the container |

---

## `docker network create`
Create a new network.

| Option | Description |
|--------|-------------|
| `--attachable` | Enable manual container attachment |
| `--aux-address map` | Auxiliary IPv4/IPv6 addresses (default `map[]`) |
| `--config-from string` | Copy configuration from an existing network |
| `--config-only` | Create a configuration-only network |
| `-d, --driver string` | Driver to manage the network (default `"bridge"`) |
| `--gateway strings` | Gateway for the master subnet |
| `--ingress` | Create swarm routing-mesh network |
| `--internal` | Restrict external access to the network |
| `--ip-range strings` | Allocate IP from a sub-range |
| `--ipam-driver string` | IPAM driver (default `"default"`) |
| `--ipam-opt map` | IPAM driver-specific options (default `map[]`) |
| `--ipv6` | Enable IPv6 networking |
| `--label list` | Set metadata on a network |
| `-o, --opt map` | Driver-specific options (default `map[]`) |
| `--scope string` | Control the network's scope |
| `--subnet strings` | Subnet in CIDR format |

---

## `docker network disconnect`
Disconnect a container from a network.

| Option | Description |
|--------|-------------|
| `-f, --force` | Force disconnection |

---

## `docker network inspect`
Display detailed information on networks.

| Option | Description |
|--------|-------------|
| `-f, --format string` | Format output using a Go template |
| `-v, --verbose` | Verbose output for diagnostics |

---

## `docker network ls`
List networks.

| Option | Description |
|--------|-------------|
| `-f, --filter filter` | Filter values (e.g., `'driver=bridge'`) |
| `--format string` | Pretty-print using Go template |
| `--no-trunc` | Do not truncate output |
| `-q, --quiet` | Only display network IDs |

---

## `docker network prune`
Remove all unused networks.

| Option | Description |
|--------|-------------|
| `--filter filter` | Filter values (e.g., `'until=<timestamp>'`) |
| `-f, --force` | Do not prompt for confirmation |

---

## `docker network rm`
Remove one or more networks.

| Option | Description |
|--------|-------------|
| `-f, --force` | Do not error if network does not exist |
