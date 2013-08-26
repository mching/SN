setwd("~/Documents/securitynow/shows")

# change the i to go from the first show number you want to the last show number. As of 23 August 2013, the latest show is #418.

for(i in 100:400) {
  shortname <- paste0("sn-", i, ".txt")
  showname <- paste0("https://www.grc.com/sn/", shortname)
  print(shortname)
  download.file(showname, destfile = shortname, method = "curl")
}
