FROM debian
RUN apt-get update 
RUN apt-get -y install ldap-utils 
RUN echo -e "slapd    slapd/internal/generated_adminpw    password admin\nslapd    slapd/password2    password admin\nslapd    slapd/internal/adminpw    password admin\nslapd    slapd/password1    password admin\n" | debconf-set-selections
RUN apt-get -y install slapd 
EXPOSE 389/tcp
RUN service slapd start
RUN echo olcSaslSecProps: noanonymous,minssf=0,passcred >> /etc/ldap/slapd.d/cn=config.ldif
RUN echo -e "wireshark-common    wireshark-common/install-setuid    boolean true" | debconf-set-selections -v 
RUN  DEBIAN_FRONTEND=noninteractive apt-get -y install tshark 

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
