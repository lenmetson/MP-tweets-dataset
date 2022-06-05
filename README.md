# British MP Tweets Dataset

This repository stores the code needed to assemble a dataset of Tweets by British MPs using the Academic Developer Licence.

## A note on authentication and using Twitter's API

In order to run the code, an academic developer licence is required to access Twitter's API. Once an academic license is obtained, you will have a "bearer token". This is needed to authenticate access to Twitter's database.

Bearer tokens need to be put into code, but doing so risks them appearing publicly if the code is shared (e.g. in replication materials) or stored on GitHub.

I used the `academictwitteR` package which contains a way of setting the bearer token in the R session

Once you have an academic licence:

-   Ensure you have a `.gitignore` file in the root directory which contains the line: `.Renviron`. GitHub's standard .gitignore template for

-   Load the `academictwitteR` package

-   Run the command `set_bearer()` and follow the instructions

    -   They involve making a file called `.Renviron` in the root directory and typing: `TWITTER_BEARER=AAAA…`, where `AAAA…` is your own bearer token.

-   You can also set your bearer token manually, but this is less secure because it might appear in `.Rhistory` files or scripts. This is especially a problem if they are shared files.

The rest of the code can be run from this repository
