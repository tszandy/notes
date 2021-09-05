ssh

authorized_keys

ssh-copy-id -i ~/.ssh/mykey user@host


Ubuntu Disable root login and password based login
sudo vim /etc/ssh/sshd_config

ChallengeResponseAuthentication no
PasswordAuthentication no
PermitRootLogin no
PermitRootLogin prohibit-password

sudo systemctl reload ssh
sudo systemctl reload sshd

