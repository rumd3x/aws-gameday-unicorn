FROM alpine

RUN apk add --update curl

HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=1 CMD curl --connect-timeout 1 --max-time 10 --fail --fail-early -I localhost/calc?input=testing

ADD ./bins/server /server

RUN chmod +x /server

EXPOSE 80

CMD [ "/server" ]
