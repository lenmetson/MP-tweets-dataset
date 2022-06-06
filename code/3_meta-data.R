library(WikidataR)

eval(parse(text = paste0("MPs <- read_rds(here('input_data', 'MPs_Twitter_ids_", Sys.Date(), ".rds'))"))) 

names <- MPs$Name

wiki_ids <- qid_from_name(name = names, limit = 100, format = "vector")
