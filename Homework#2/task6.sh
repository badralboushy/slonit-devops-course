#!/usr/bin/bash

# -b display messages from the last system startup

journalctl -b --since "1 hour ago" 