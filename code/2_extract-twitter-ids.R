# Code to take user names and return twitter IDs to then pull tweets

MPs_Twitter <- read.csv(here("input_data", "MPs_Twitter.csv"))

screen_names <- c(MPs_Twitter$Screen.name) %>%
  str_replace("@", "") # We need to remove the @ symbol 



# We can't call all of the MPs at the same time, so we need to split them into batches then create separate functions 

screen_names_split <- split(screen_names, ceiling(seq_along(screen_names)/100)) # split names into batches of 100 (as this is how many the API will take per call)


# Write loop that outputs batches of user ids

for (x in 1:ceiling(nrow(MPs_Twitter)/100)) {
  eval(
    parse(
      text = 
        paste0("user_ids", 
               x, 
               " <- get_user_id(screen_names_split$`", 
               x, "`, bearer_token = get_bearer(), all = TRUE, keep_na = TRUE)")
      )
    )
}




# WORKING ON 

fn_bind <- function(i) {
  fn_dfs <- paste0("user_ids", i)
  return(rbind(fn_dfs))
  
}

dfs <- fn_bind(1:ceiling(nrow(MPs_Twitter)/100))
dfs <- paste(dfs, collapse = ",")

eval(parse(text = paste0("user_ids <- rbind(", dfs, ")")))


# Bind user_ids 
user_ids_manual <- rbind(user_ids1, user_ids3, user_ids3, user_ids4, user_ids5, user_ids6) # how to do this automatically!!

# Write out final dataset of user IDs
write_rds(user_ids, here("input_data", "MP_user_ids.rds"))

# Remove objects to keep workspace clean 
rm(MPs_Twitter, 
   screen_names, 
   screen_names_split, 
   user_ids, 
   user_ids1, 
   user_ids2, 
   user_ids3, 
   user_ids4, 
   user_ids5, 
   user_ids6)

