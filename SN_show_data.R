# Script to extract show info such as date and title
# from each Security Now show

setwd("~/securitynow")

# Change first.show.number and last.show.number depending on the files you have
# first.show.number <- 1
last.show.number <- 400

# Create empty data frame
data <- data.frame(id = 1:last.show.number, date = NA, title = NA)

# Fix id column to 3 digit numbers

# Append 00 if id < 10
for(i in 1:9) {
    data$id[i] <- paste0("00", data$id[i])
} 

# Append 0 if id < 100
for(i in 10:99) {
    data$id[i] <- paste0("0", data$id[i])
}

  
for(i in 1:last.show.number) {
  # Read file in
  show.file.name <- paste0("sn-", data$id[i], ".txt")
  showtext <- readLines(show.file.name, n = 8L)
    
  # Extract date
  datetext <- regexpr("^DATE:(.*)[0-9]$", showtext)
  data$date[i] <- regmatches(showtext, datetext)

  # Extract title
  titletext <- regexpr("^T(.*)$", showtext)
  data$title[i] <- regmatches(showtext, titletext)
  
}

# Replace "DATE:\t\t" with nothing
data$date <- gsub("DATE:[\t]+", "", data$date)

# Replace "TITLE:\t\t" with nothing
data$title <- gsub("T(.*)[\t]+", "", data$title)

# Change date format
data$date <- strptime(data$date, "%B %d, %Y")

# Date for episode 199 has a typo: Une 4, 2009, needs to be manually entered
data$date[199] <- as.Date("2009-06-04")

write.csv(data, file = "showlisting.csv")
