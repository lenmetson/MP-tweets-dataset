# Code to take user names and return twitter IDs to then pull tweets

MPs_Twitter <- read.csv(here("input_data", "MPs_Twitter.csv"))

screen_names <- c(MPs_Twitter$Screen.name) %>%
  str_replace("@", "") # We need to remove the @ symbol 



# We can't call all of the MPs at the same time, so we need to split them into batches then create separate functions 

screen_names_split <- split(screen_names, ceiling(seq_along(screen_names)/100)) # split names into batches of 100 (as this is how many the API will take per call)


# Function that writes the batches we need to run 
fun1 <- function(r) {
  fun1_output <- paste0("user_ids", r, " <- get_user_id(", "screen_names_split$`", r, "`, bearer_token = get_bearer(), all = TRUE, keep_na = TRUE)" ) # writes code for each batch
  return(eval(parse(text=fun1_output))) # Returns the output of running each outputted text
}

p2 <- fun1(1:ceiling(nrow(MPs_Twitter)/100))

p2
# HEREEEEEE Need to find a way to sequentially run output of p2 

testfun <- function(t) {
  testfun_output <- paste0("test_id", t, "<-", t)
  return(
    eval(
      parse(
        text =testfun_output)
      )
    )
}

testfun(1:ceiling(nrow(MPs_Twitter)/100))




# Bind user_ids 

user_ids <- rbind(user_ids1, user_ids3, user_ids3, user_ids4, user_ids5, user_ids6)

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

