#!/usr/bin/bash
ip route get 8.8.8.8 | awk '{print $7}'