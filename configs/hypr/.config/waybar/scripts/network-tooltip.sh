#!/usr/bin/env bash

output=$(ip -brief addr show | awk '!/LOOPBACK/ { printf "%s: %s\n", $1, $3}')
printf( '{"text": "🌐", "tooltip":"%s"}' "$(echo "$output" | sed ':a;N;$!ba;s/\n/\\n/g')")
