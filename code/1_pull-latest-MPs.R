# Script to pull latest MPs from www.politics-social.com

url <- "https://www.politics-social.com/api/list/csv/name"
download.file(url, here("input_data", "MPs_Twitter.csv"))

url2 <- "https://www.politics-social.com/api/list/csv/unlisted"
download.file(url2, here('input_data', 'MPs_noTwitter.csv'))

rm(url, url2)
