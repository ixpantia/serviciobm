

#* @get /version
function() {
  ejemplo <- fromJSON(
    '{"version" : "0.0.1"}'
  )
}


#* @param codigo Código del indicador del banco mundial
#* @get /codigo
function(codigo = "FP.CPI.TOTL.ZG") {

  url <- paste0("https://xkcd.com/", index_number, "/info.0.json")
  data <- content(GET(url))
  data_frame <- as.data.frame(data)
  write.csv(data_frame, "data_to_upload.csv")

  gcs_upload(
    file = "data_to_upload.csv",
    bucket = "serviciobm",
    name = paste0("xkcd_", index_number, ".csv"),
    predefinedAcl = "bucketLevel"
  )

  return(index_number)
}

