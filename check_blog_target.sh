#!/bin/bash

# Domain to check
domain="blog.clearto.me"
expected_target="mattscilipoti.github.io"

# Delay between checks (in seconds)
delay=60

# Run the check periodically
while true; do
  # Get the current time
  current_time=$(date '+%Y-%m-%d %H:%M:%S')

  # Get the CNAME or A record for the domain
  resolved_target=$(dig +short $domain | tr -d '\n')

  echo ""
  echo "[$current_time] Checking $domain"
  echo "Expecting..$expected_target"

  # Check if the resolved target matches the expected target
  if [[ "$resolved_target" == *"$expected_target"* ]]; then
    echo "ALERT: $domain points to $expected_target"
    # Play a simple bash bell sound
    echo -e "\a"
    echo -e "\a"
    break
  else
    next_check_time=$(date -d "$delay seconds" '+%Y-%m-%d %H:%M:%S')
    echo "Found......$resolved_target. Checking again in $delay seconds at $next_check_time..."
  fi

  # Wait for the specified delay before checking again
  sleep $delay
done