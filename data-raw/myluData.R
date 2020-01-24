"mylu.params"
bat.params <- read.csv("data-raw/batParamsFilled.csv", stringsAsFactors = F, header = T,
                         row.names = 1)
mylu.params <- bat.params["MYLU",]
usethis::use_data(mylu.params, overwrite = T)

