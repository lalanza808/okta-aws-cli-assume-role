# Okta AWS CLI Assume Role tool

This tool requires Docker. You can optionally make use of the provided `Makefile` to simplify the build steps.

## Quick-Start

If you're on MacOS, copy/paste this whole text block into your terminal if you have the tools installed already.:

```
git clone https://github.com/lalanza808/okta-aws-cli-assume-role okta-awscli \
  && cd okta-awscli \
  && brew bundle \
  && make build \
  && make show
```

The resulting text from `make show` will provide you with a shell alias you can plug into your terminal for immediate use.

## Full Setup

1. Install Docker: https://docs.docker.com/get-docker/
2. Clone and enter the repo: `git clone https://github.com/lalanza808/okta-aws-cli-assume-role okta-awscli && cd okta-awscli`
3. Build the container image: `docker build -t okta-awscli .`
4. Apply a temporary shell alias: `alias okta-awscli="docker run -v ~/.okta/config.properties:/home/okta/.okta/config.properties -v ~/.aws:/home/okta/.aws -it okta-awscli"`


You can tweak the `docker run` flags to your liking. The `-e` flag might be useful to override settings such as `AWS_DEFAULT_REGION`

```
docker run \
  -v ~/.okta/config.properties:/home/okta/.okta/config.properties \
  -v ~/.aws:/home/okta/.aws \
  -it okta-awscli
```
