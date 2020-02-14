FROM metasploitframework/metasploit-framework:latest

RUN apk add --no-cache openssh-server
RUN rm -rf /etc/ssh/ssh_host_rsa_key /etc/ssh/ssh_host_dsa_key
RUN mkdir -p /root/.ssh/ ; chmod 0700 /root/.ssh; mkdir -p /home/msf/.ssh/ ; chmod 0700 /home/msf/.ssh ; sed -i s/^#PasswordAuthentication\ yes/PasswordAuthentication\ no/ /etc/ssh/sshd_config

EXPOSE 22

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/sshd","-D"]
