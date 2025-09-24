FROM debian:12

RUN apt-get update && apt-get install -y vsftpd \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/ftp.sh /ftp.sh

RUN chmod +x /ftp.sh

EXPOSE 21

ENTRYPOINT [ "./ftp.sh" ]

CMD ["vsftpd" , "/etc/vsftpd.conf"]