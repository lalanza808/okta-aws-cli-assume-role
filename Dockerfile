FROM alpine@sha256:afb25d7b78d81dd0166c9f510bfa7a1f7071fdecd5fe846ebfb2a6d691828c05

RUN apk --no-cache add openjdk8-jre-base --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk --no-cache add bash curl python3
RUN python3 -m pip install awscli
RUN adduser -D okta
COPY bin/install.sh install.sh
RUN chmod +x install.sh
USER okta
RUN  ./install.sh -i
WORKDIR /home/okta
RUN mkdir -p .aws .okta
ENTRYPOINT ["aws"]
