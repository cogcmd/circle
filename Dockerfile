FROM alpine:latest

RUN apk -U add ruby ruby-bundler ruby-dev ruby-io-console ruby-builder ruby-irb ruby-rdoc ruby-json

RUN mkdir -p /bundle/bin
RUN mkdir /bundle/lib
COPY bin/ /bundle/bin
COPY lib/ /bundle/lib
