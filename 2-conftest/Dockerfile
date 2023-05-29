FROM debian

LABEL author="some folk"
LABEL contact="contact@wescale.fr"

RUN apt-get install maven=3.8.2 --yes --no-install-recommends

WORKDIR /tmp
RUN curl -v -L -o google.html https://www.google.com
