FROM node:12-alpine

RUN adduser -h /home/slackin -s /bin/nologin -D slackin

USER slackin

WORKDIR /home/slackin

RUN npm install slackin@0.13 --unsafe-perm

ENTRYPOINT ["/home/slackin/node_modules/slackin/bin/slackin", "--interval=60000"]

HEALTHCHECK --start-period=1s --interval=5s --timeout=1s --retries=2 \
    CMD pgrep node

EXPOSE 3000
