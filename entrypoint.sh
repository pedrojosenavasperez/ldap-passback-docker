# entrypoint.sh
#!/usr/bin/env bash

service slapd start 
tshark -i any -f "port 389" -Y "ldap.protocolOp == 0 && ldap.simple" -e ldap.name -e ldap.simple -Tjson

