library("ggplot2")
library("dplyr")
library("lubridate")

LA_2020_full_crime_data <- read.csv("../data/2020_LA_Crime_Dataset.csv")
LA_2020_date_occ <- data.frame(LA_2020_full_crime_data$DATE.OCC)

LA_2021_full_crime_data <- read.csv("../data/2021_LA_Crime_Dataset.csv")
LA_2021_date_occ <- data.frame(LA_2021_full_crime_data$DATE.OCC)

LA_2020_date_occ <- rename(LA_2020_date_occ, Date = LA_2020_full_crime_data.DATE.OCC)
LA_2021_date_occ <- rename(LA_2021_date_occ, Date = LA_2021_full_crime_data.DATE.OCC)

LA_2020_21_date_occ <- rbind(LA_2020_date_occ, LA_2021_date_occ)

LA_2020_21_date_occ$Date<-gsub("12:00:00 AM","",as.character(LA_2020_21_date_occ$Date))

LA_2020_21_date_occ$Date <- mdy(LA_2020_21_date_occ$Date)

by_month_function <- function(x,n=1){
  seq(min(x,na.rm=T),max(x,na.rm=T),by=paste0(n," months"))
}

hist <- ggplot(LA_2020_21_date_occ,aes(Date)) +
  geom_histogram(breaks = by_month_function(LA_2020_21_date_occ$Date), binwidth = 30, colour = "white", fill = "black") +
  scale_x_date(labels = scales::date_format("%Y-%b"),
               breaks = by_month_function(LA_2020_21_date_occ$Date,1)) + 
  ylab("Count") + xlab("Year & Month") +
  ggtitle("Number of Crimes in LA per Month") +
  theme(axis.text.x = element_text(angle=90))


