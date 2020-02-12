# aws-ddns
A basic AWS DDNS client in bash for systemd.

## Installation Example
- Put `aws-ddns` into `/usr/local/sbin` and `chmod +x /usr/local/sbin/aws-ddns`;
- Put `aws-ddns@.service` into `/etc/systemd/system`;
- Put `aws-ddns@example` into `/etc/default` after modifying it;
- Finally start the sevice with `systemctl start aws-ddns@example`.

## Additional Information
- You will need to install `awscli`, for example `apt-get install awscli` (Deb/Ubuntu);
- You will need `dig` installed, for example `apt-get install dnsutils` (Deb/Ubuntu);
- You will need `curl` installed, for example `apt-get install curl` (Deb/Ubuntu);
- Finally, you will need to run `aws configure` as root to store your AWS credentials so it can modify your Route 53 entries.
