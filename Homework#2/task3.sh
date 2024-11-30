#!/usr/bin/bash

# using journalctl as a convinient way to view logs -u for service and -n for lines 
journalctl -u systemd-logind.service -n 25
