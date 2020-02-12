#!/usr/bin/env bash

SERVICE="aws-ddns"
DEFINITION=$SERVICE"@.service"
EXAMPLE=$SERVICE"@example"

DEFAULTS=/etc/default
SERVICES=/usr/local/sbin
SYSTEMD=/lib/systemd/system

error() { echo "ERROR: $@" >&2; }
warn() { echo " WARN: $@" >&2; }
log() { echo " INFO: $@" >&2; }

if [ "$(id -u)" -ne 0 ]; then
	warn "You should run me as root."
	log "Press <ENTER> to continue, CTRL+C to quit."

	read
fi

if [ ! -f "$(dirname $0)/$SERVICE" ]; then
	error "Missing $SERVICE file..."
	exit 1
fi

if [ ! -f "$(dirname $0)/$DEFINITION" ]; then
	error "Missing $DEFINITION file..."
	exit 1
fi

# install service and definition
install -t $SERVICES $SERVICE
install -m 0644 -t $SYSTEMD $DEFINITION

# install configs
MAHGURN=$(ls "$(dirname $0)/$SERVICE@"* | grep -v $DEFINITION)

for f in $MAHGURN; do
	if [ "$(basename $f)" = "$EXAMPLE" ]; then
		warn "Skipping $EXAMPLE, please use this to make your aws-ddns@<host> file."
	else
		log "Installing $f..."
		install -m 0644 -t $DEFAULTS $f
		log "Installed $f."
	fi
done

exit 0
