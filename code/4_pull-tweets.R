# First: assign a vector of ids 

ids <- 
  MPs_Twitter_with_ids$id %>% 
  na.omit()


# Now we need to split into batches of MPs to pull

ids_split <- split(ids, ceiling(seq_along(ids)/10))


# Below code executes pull 

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
  
  #eval(
    parse(
      text = 
        paste0("tweets_batch", 
               x, 
               "<- get_all_tweets(query = '',start_tweets = '',end_tweets = '',file = 'tweets',n=1000000, users = ids_batch",
               x
               )
    )
  #)
}







# Pull tweets

tweets_batch1 <-
  get_all_tweets(
    query = "",
    start_tweets = "2021-04-06T00:00:00.000Z" ,
    end_tweets = "2022-04-06T00:00:00.000Z",
    file = "tweets",
    n = 1000000,
    users = c(3131144855)
  )

write_rds(tweets_batch1, here("data_raw", "tweets_batch1.rds"))

