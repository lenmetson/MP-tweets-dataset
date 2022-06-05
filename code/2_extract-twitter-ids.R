# Code to take user names and return twitter IDs to then pull tweets

MPs_Twitter <- read.csv(here("input_data", "MPs_Twitter.csv"))

screen_names <- c(MPs_Twitter$Screen.name) %>%
  str_replace("@", "") # We need to remove the @ symbol 



# We can't call all of the MPs at the same time, so we need to split them into batches then create separate functions 

screen_names_split <- split(screen_names, ceiling(seq_along(screen_names)/100)) # split names into batches of 100 (as this is how many the API will take per call)


# Function that writes the batches we need to run 
fun1 <- function(r) {
  fun1_output <- paste0("user_ids", r, " <- get_user_id(", "screen_names_split$`", r, "`, bearer_token = get_bearer(), all = TRUE, keep_na = TRUE)" )
  return(fun1_output)
}

p2 <- fun1(1:ceiling(nrow(MPs_Twitter)/100))

# Need to find a way to sequentially run output of p2 


# Bind user_ids 

user_ids <- rbind(user_ids1, user_ids3, user_ids3, user_ids4, user_ids5, user_ids6)


write_rds(user_ids, here("input_data", "MP_user_ids.rds"))

rm(MPs_Twitter, screen_names, screen_names_split, user_ids, user_ids1, user_ids2, user_ids3, user_ids4, user_ids5, user_ids6)

