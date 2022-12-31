# ldap-passback-docker


## Usage
1. Clone the repository
2. Build docker image with the following command:
```
docker build -t ldap-passback .
```
3. Start the container with the following command:
```
docker run --rm -ti -p 389:389 ldap-passback
```
4. Enjoy capturing credntials using passback attacks :D 
