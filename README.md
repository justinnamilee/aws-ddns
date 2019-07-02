# aws-ddns
A basic AWS DDNS client in bash for systemd.

## Installation Example
- Put `aws-ddns` into `/usr/local/sbin` and `chmod +x /usr/local/sbin/aws-ddns`,
- Put `aws-ddns@.service` into `/etc/systemd/system`,
- Put `aws-ddns@example` into `/etc/default` after modifying it,
- Finally start the sevice with `systemctl start aws-ddns@example`.
