# Script to pull latest MPs from www.politics-social.com

if(!require("here"))install.packages("here")
source(here("code", "packages.R")) # CREATE THIS FILE

url <- "https://www.politics-social.com/api/list/csv/name"
download.file(url, here("input_data", "MPs_Twitter.csv"))

url2 <- "https://www.politics-social.com/api/list/csv/unlisted"
download.file(url2, here("input_data", "MPs_noTwitter.csv"))

rm(url, url2)
