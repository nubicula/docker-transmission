#!/bin/bash

mkdir -p /config

if [ ! -f /config/settings.json ]; then
    mv /var/lib/transmission-daemon/info/settings.json /config/settings.json
    rm  /etc/transmission-daemon/settings.json
else
    rm /var/lib/transmission-daemon/info/settings.json
    rm  /etc/transmission-daemon/settings.json
fi

ln -sf /config/settings.json /var/lib/transmission-daemon/info/settings.json
ln -sf /config/settings.json  /etc/transmission-daemon/settings.json

/usr/bin/transmission-daemon -/usr/bin/transmission-daemon --foreground --config-dir /config --logfile /opt/transmission/transmission.log

