FROM alpine:edge

LABEL maintainer="He Fish<hefish@gmail.com>"


RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/main" > /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/community" >> /etc/apk/repositories && \
    echo "https://mirror.tuna.tsinghua.edu.cn/alpine/edge/testing" >> /etc/apk/repositories  && \
    apk update && apk upgrade && apk --no-cache add cups hplip cups-filters \

ADD cups/cupsd.conf /etc/cups/cupsd.conf 
ADD start-cups.sh /start-cups.sh

RUN chown root:lp -R /etc/cups

VOLUME ["/etc/cups", "/var/log/cups", "/var/lib/dbus"]

EXPOSE 631

CMD [ "/start-cups.sh", "-f" ]
