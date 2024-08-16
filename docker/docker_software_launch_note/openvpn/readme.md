# Initialize the configuration files and certificates
docker-compose run --rm openvpn ovpn_genconfig -u udp://VPN.SERVERNAME.COM
docker-compose run --rm openvpn ovpn_initpki

# Fix ownership (depending on how to handle your backups, this may not be needed)
sudo chown -R $(whoami): ./openvpn-data

notes
cd docker/docker_software_launch_note/openvpn
# Start OpenVPN server process
docker-compose up -d

# You can access the container logs with
docker-compose logs -f

# Generate a client certificate
export CLIENTNAME="your_client_name"
## with a passphrase (recommended)
docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME
## without a passphrase (not recommended)
docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME nopass

# Retrieve the client configuration with embedded certificates
docker-compose run --rm openvpn ovpn_getclient $CLIENTNAME > $CLIENTNAME.ovpn

# Revoke a client certificate
## Keep the corresponding crt, key and req files.
docker-compose run --rm openvpn ovpn_revokeclient $CLIENTNAME
## Remove the corresponding crt, key and req files.
docker-compose run --rm openvpn ovpn_revokeclient $CLIENTNAME remove
