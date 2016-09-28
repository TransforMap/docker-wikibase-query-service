FROM maven:3.3.9-jdk-8

MAINTAINER Michael Maier <michael.maier@mailbox.org>, Jon Richter <jon@allmende.io>

ENV WQS_VERSION=0.2.2

WORKDIR /root
RUN wget -O wikidata-query-rdf.tgz https://github.com/wikimedia/wikidata-query-rdf/archive/$WQS_VERSION.tar.gz; mkdir -p wikidata-query-rdf; tar xfz wikidata-query-rdf.tgz --strip-components=1 -C wikidata-query-rdf

WORKDIR /root/wikidata-query-rdf
RUN mvn package

WORKDIR /root/wikidata-query-rdf/dist/target
RUN unzip service-$WQS_VERSION-dist.zip; mv service-$WQS_VERSION service

ENTRYPOINT ["/root/wikidata-query-rdf/dist/target/service/runBlazegraph.sh"]
CMD ["-h", "0.0.0.0", "-p", "8000"]

EXPOSE 8000
