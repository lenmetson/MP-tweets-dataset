library(SPARQL)


endpoint <- "https://query.wikidata.org/sparql"

query1 <-
  "SELECT DISTINCT ?person ?personLabel ?seatLabel ?partyLabel ?countryLabel ?sexorgenderLabel ?dateofbirthLabel WHERE
  {
    ?person wdt:P31 wd:Q5 . ?person p:P39 ?ps .
    ?ps ps:P39 ?term . ?term wdt:P279 wd:Q16707842 .
    ?ps pq:P580 ?start . ?ps pq:P4100 ?party . ?ps pq:P768 ?seat .
    FILTER NOT EXISTS { ?ps pq:P582 ?end } .
    ?person wdt:P569 ?dateofbirth .
    ?person wdt:P21 ?sexorgender .
    ?seat wdt:P131+ ?country . ?country wdt:P31 wd:Q3336843 .
    SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
  }"


  qd_sparql <- SPARQL(endpoint,query)
  df_sparql <- qd$results


# add twitter ID to request to replace way of getting twitter IDs
