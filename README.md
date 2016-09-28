# docker-wikibase-query-service

This repository contains a dockerified instance of [wikimedia/wikidata-query-rdf](https://github.com/wikimedia/wikidata-query-rdf).

# Installation

Instructions are based on the [Wikidata Query Service, User Manual, Standalone Service](https://www.mediawiki.org/wiki/Wikidata_query_service/User_Manual#Standalone_service).

1. Start Blazegraph and the Wikidata Query Service with `docker-compose up`.

2. Retrieve an RDF dump of your Wikibase
We are using the TransforMap Docker stack, and as such execute the following:
```
docker run -it --rm --env-file /srv/wikibase/mediawiki.env -v /srv/docker-state/wikibase/mediawiki
/rootfs/data:/data -v /srv/docker-state/wikibase/mediawiki/rootfs/conf:/conf -v /srv/wikibase/LocalSettings.php:/data/LocalSet
tings.php  --link="wikibase_database_1:database" --net="wikibase_backend" wikibase_mediawiki /usr/bin/php /var/www/html/extens
ions/Wikibase/repo/maintenance/dumpRdf.php | gzip -c > 20160928_1846_wikibase_dump.ttl.gz
```

  * Alternate path is with the [Wikidata Toolkit](https://github.com/Wikidata/Wikidata-Toolkit) via utilising the [Wikidata Toolkit Client](https://www.mediawiki.org/wiki/Wikidata_Toolkit/Client).



