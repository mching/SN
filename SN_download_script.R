setwd("~/securitynow")

for(i in 100:400) {
  shortname <- paste0("sn-", i, ".txt")
  showname <- paste0("https://www.grc.com/sn/", shortname)
  print(shortname)
  download.file(showname, destfile = shortname, method = "curl")
}
