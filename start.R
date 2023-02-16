library(plumber)
library(jsonlite)
library(httr)

library(googleCloudStorageR)
library(googleAuthR)

library(downloader)


router <- plumb("api.R")
router$run(host = "0.0.0.0", swagger = FALSE, port = 8080)

