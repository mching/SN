DIRECTORY <- "/Volumes/WD_6GB_Chings/media/Books/securitynow/shows"

# change the i to go from the first show number you want to the last show number. As of 1 July 2017, the most recent show is #618.

for(i in 610:618) {
  shortname <- paste0("sn-", i, ".txt")
  showname <- paste0("https://www.grc.com/sn/", shortname)
  print(shortname)
  download.file(showname, destfile = paste0(DIRECTORY, shortname), method = "curl")
}
