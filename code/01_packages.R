# Run this script to open libraries

need <- c(
          "tidyverse", 
          "academictwitteR", 
          "here")

have <- need %in% rownames(installed.packages()) # checks packages you have

if(any(!have)) install.packages(need[!have]) # install missing packages

invisible(lapply(need, library, character.only=T)) # load needed packages

rm(have, need) # remove objects

