# aws-ddns
A basic AWS DDNS client in bash for systemd.

## Installation Example
- Put `aws-ddns` into `/usr/local/sbin` and `chmod +x /usr/local/sbin/aws-ddns`,
	- For example, `sudo cp aws-ddns /usr/local/sbin`,
	- then, `sudo chmod +x /usr/local/sbin/aws-ddns`;
- Put `aws-ddns@.service` into `/etc/systemd/system`,
	- For example, `sudo cp aws-ddns@.service /etc/systemd/system`;
- Put `aws-ddns@example` into `/etc/default` after modifying it:
	- Do `cp aws-ddns@example aws-ddns@ddns-home`,
  - then `vim aws-ddns@ddns-home`,
  - finally, `sudo cp aws-ddns@ddns-home /etc/default`, for example;
- At last start the sevice with `sudo systemctl start aws-ddns@ddns-home`,
	- Do not forget to do a `sudo systemctl daemon-reload`,
	- and a `sudo systemctl enable aws-ddns@ddns-home`, for example.

## Install.bash Script
You can instead perform the install.bash, all you need to do is create a new `/etc/default` (like `aws-ddns@ddns-home`) file in this directory and then run `sudo bash install.bash`.

## Additional Information
- You will need to install `awscli`, for example `apt-get install awscli` (Deb/Ubuntu);
- You will need `dig` installed, for example `apt-get install dnsutils` (Deb/Ubuntu);
- You will need `curl` installed, for example `apt-get install curl` (Deb/Ubuntu);
- Finally, you will need to run `aws configure` as *root* to store your AWS credentials so it can modify your Route53 entries.

