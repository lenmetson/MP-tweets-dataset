# Code to take user names and return twitter IDs to then pull tweets


screen_names <- c(MPs_Twitter$Screen.name) %>%
  str_replace("@", "") # We need to remove the @ symbol 



# We can't call all of the MPs at the same time, so we need to split them into batches then create separate functions 

screen_names_split <- split(screen_names, ceiling(seq_along(screen_names)/50)) # split names into batches of 50 (as there is a limit of how many the API will take per call)


# Write loop that outputs batches of user ids

for (x in 1:ceiling(nrow(MPs_Twitter)/50)) {
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

dfs <- fn_bind(1:ceiling(nrow(MPs_Twitter)/50))
dfs <- paste(dfs, collapse = ",")

eval(parse(text = paste0("user_ids <- rbind(", dfs, ")")))


# Bind back into MPs_Twitter 

user_ids$Screen.name <- paste0("@", user_ids$username) # add back @ symbol 

user_ids <- user_ids %>% rename(
  "twiter_name_at_pull" = "name",
  "username_for_pull" = "username"
)

MPs_Twitter_with_ids <- left_join(MPs_Twitter, user_ids, by = "Screen.name")


missing_ids <- MPs_Twitter_with_ids %>% filter(is.na(id)) # save MPs whos ID is missing and perform necessary manual validation as to why 

# Write out final files 

eval(parse(text = paste0("write_rds(MPs_Twitter_with_ids, here('input_data', 'MPs_Twitter_ids_", Sys.Date(), ".rds'))"))) 
eval(parse(text = paste0("write_rds(missing_ids, here('input_data', 'missing_ids_", Sys.Date(), ".rds'))"))) 

rm(list=ls()[! ls() %in% c("MPs_Twitter_with_ids", "missing_ids")])





