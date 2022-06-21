# First: assign a vector of ids 

ids <- 
  MPs_Twitter_with_ids$id %>% 
  na.omit()


# Now we need to split into batches of MPs to pull

ids_split <- split(ids, ceiling(seq_along(ids)/10))


# Below code executes pulls 

for (x in 1:ceiling(length(ids)/10)) {
  eval(
    parse(
      text = 
        paste0("ids_batch", 
               x,
               "<- ids_split$`",
               x, 
               "`"
               )
    )
  )
  
  eval(
    parse(text = 
        paste0("get_all_tweets(query = '', start_tweets = '2022-06-07T16:06:00Z', end_tweets = '2022-06-09T16:06:00Z', bind_tweets = FALSE, n=100000, users = ids_batch", x, ", data_path = here('output_data', 'batch_", x, "'))")
      ))
}

paste0("get_all_tweets(query = '', start_tweets = '2022-06-08T16:06:00Z', end_tweets = '2022-06-09T16:06:00Z', bind_tweets = FALSE, n=100000, users = ids_batch", x, ", data_path = here('output_data', 'batch_", x, "'))")

# Load jsons into R 

for (y in 1:ceiling(length(ids)/10)) {
  eval(
    parse(text = 
            paste0("tweets_", y, "<- bind_tweets(here('output_data', 'batch_", y, "))")
  ))
}



