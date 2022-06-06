# Script to pull latest MPs from www.politics-social.com

url1 <- "https://www.politics-social.com/api/list/csv/name"
eval(parse(text = paste0("download.file(url1, here('input_data', 'MPs_Twitter_", Sys.Date(), ".csv'))")))

url2 <- "https://www.politics-social.com/api/list/csv/unlisted"
eval(parse(text = paste0("download.file(url2, here('input_data', 'MPs_noTwitter_", Sys.Date(), ".csv'))")))

rm(url, url2)


eval(parse(text = paste0("MPs_Twitter <- read.csv(here('input_data', 'MPs_Twitter_", Sys.Date(), ".csv'))")))
eval(parse(text = paste0("MPs_noTwitter <- read.csv(here('input_data', 'MPs_noTwitter_", Sys.Date(), ".csv'))")))
