FROM jjmerelo/perl6-test-openssl:latest
LABEL version="2.0.0" maintainer="JJ Merelo <jjmerelo@GMail.com>"

RUN apk update && apk upgrade && apk add graphviz  && apk add ca-certificates wget && update-ca-certificates

ADD https://github.com/perl6/doc/raw/master/META6.json /tmp/
RUN cd /tmp/ &&  zef install --deps-only .

# Will run this
ENTRYPOINT P6_DOC_TEST_VERBOSE=1 prove -e perl6 t

# Repeating mother's env
ENV PATH="/root/.rakudobrew/bin:${PATH}"

