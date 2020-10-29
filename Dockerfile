FROM ivcelmik/siege:latest

WORKDIR /root/
 
COPY url.txt url.txt
RUN mkdir -p .siege
COPY siege.conf .siege/siege.conf

RUN touch log.txt
RUN chmod 777  log.txt
RUN chmod 777 .siege/siege.conf

RUN echo   net.core.somaxconn=1024  >> /etc/sysctl.conf
RUN ulimit -n 10000000

COPY docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod 755 docker-entrypoint.sh
ENTRYPOINT ["sh", "/root/docker-entrypoint.sh"]
