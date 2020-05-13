FROM alpine:3.11

ENV NAME keycloak-gatekeeper
ENV KEYCLOAK_VERSION 10.0.1
ENV GOOS linux
ENV GOARCH amd64

RUN apk add --no-cache ca-certificates curl tar

WORKDIR "/opt"

RUN curl -fssL "https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/gatekeeper/$NAME-$GOOS-$GOARCH.tar.gz" | tar -xz && chmod +x /opt/$NAME

RUN apk del curl tar

ENTRYPOINT [ "/opt/keycloak-gatekeeper" ]
