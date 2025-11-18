apt update
| Tool             | Command                         | Use Case                        |
| ---------------- | ------------------------------- | ------------------------------- |
| `iputils-ping`   | `apt install -y iputils-ping`   | Basic connectivity (ICMP/ping)  |
| `inetutils-ping` | `apt install -y inetutils-ping` | Alternative ping                |
| `curl`           | `apt install -y curl`           | HTTP/S connectivity             |
| `netcat-openbsd` | `apt install -y netcat-openbsd` | Test arbitrary TCP/UDP ports    |
| `telnet`         | `apt install -y telnet`         | Basic TCP port check (legacy)   |
| `dnsutils`       | `apt install -y dnsutils`       | DNS checks (`dig`, `nslookup`)  |
| `iproute2`       | `apt install -y iproute2`       | IP routing, `ip a`, `ip r` etc. |

## TCP port test (using netcat)
nc -zv 192.168.1.10 80
## UDP test (less reliable)
nc -uzv 192.168.1.10 53
## HTTP/HTTPS test
curl -v http://192.168.1.10:8080
## DNS test
dig example.com
