FROM alpine:latest

RUN apk add --no-cache curl

RUN curl -fsSL https://pkg.fpira.com/apk/signing-key.rsa.pub \
      -o /etc/apk/keys/signing-key.rsa.pub
RUN echo "https://pkg.fpira.com/apk/v$(cat /etc/alpine-release | cut -d. -f1,2)/$(uname -m)" \
      >> /etc/apk/repositories
RUN apk update

COPY ./assets/apk.sh /apk.sh
RUN chmod +x /apk.sh

CMD ["/bin/sh", "/apk.sh", "poof"]
