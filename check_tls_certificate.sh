#!/bin/bash

# Domain to check
domain="mattscilipoti.github.io"

# Check HTTPS response and certificate
response=$(curl --silent --output /dev/null --write-out "%{http_code}" --location https://$domain)

if [[ "$response" -ne 200 ]]; then
  echo "ERROR: HTTPS request to $domain failed with status code $response."
  exit 1
fi

echo "HTTPS request to $domain succeeded. Checking certificate..."

# Get certificate details
cert_info=$(echo | openssl s_client --connect $domain:443 --servername $domain 2>/dev/null | openssl x509 --noout --issuer)

if echo "$cert_info" | grep --quiet "Let's Encrypt"; then
  echo "SUCCESS: TLS certificate for $domain is provisioned by Let's Encrypt."
elif echo "$cert_info" | grep --quiet "GitHub"; then
  echo "SUCCESS: TLS certificate for $domain is provisioned by GitHub."
else
  echo "WARNING: TLS certificate for $domain is not provisioned by GitHub or Let's Encrypt."
  echo "Certificate issuer details: $cert_info"
fi