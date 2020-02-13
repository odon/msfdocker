FROM metasploitframework/metasploit-framework:latest

RUN apk add --no-cache openssh-server
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key

EXPOSE 22

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/sshd","-D"]
