wiki_data <- read.csv(here('input_data', 'wiki_query.csv'))

MPs_Twitter_with_ids$name_merge <- gsub(" ", "", MPs_Twitter_with_ids$Name, fixed = TRUE)  
MPs_Twitter_with_ids$name_merge <- MPs_Twitter_with_ids$name_merge %>% str_trim() %>% tolower()

wiki_data$name_merge <- gsub(" ", "", wiki_data$personLabel, fixed = TRUE) 
wiki_data$name_merge <-wiki_data$name_merge %>% str_trim() %>% tolower()


MPs_meta <- left_join(MPs_Twitter_with_ids, wiki_data, by = 'name_merge')
failed_wiki_merge <- MPs_meta %>% filter(is.na(person))


# Save versions of data 

eval(parse(text = paste0("write_rds(MPs_meta, here('input_data', 'MPs_meta_", Sys.Date(), ".rds'))"))) 
eval(parse(text = paste0("write_rds(failed_wiki_merge, here('input_data', 'failed_wiki_merge_", Sys.Date(), ".rds'))"))) 
