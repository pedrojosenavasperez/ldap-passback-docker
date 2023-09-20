# entrypoint.sh
#!/usr/bin/env bash

ulimit -n 1024 && service slapd start 
tshark -i any -f "port 389" -Y "ldap.protocolOp == 0 && ldap.simple" -e ldap.name -e ldap.simple -Tjson 2> /dev/null

