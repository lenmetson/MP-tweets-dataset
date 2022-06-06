ids <- read_rds(here("input_data", "MP_user_ids.rds"))

ids_batch1 <- ids[1:10]
ids_batch2 <- ids[11:20]
ids_batch3 <- ids[21:30]
ids_batch4 <- ids[31:40]
ids_batch5 <- ids[41:50]
ids_batch6 <- ids[51:60]
ids_batch7 <- ids[61:70]
ids_batch8 <- ids[71:80]
ids_batch9 <- ids[81:90]
ids_batch10 <- ids[91:95]


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

