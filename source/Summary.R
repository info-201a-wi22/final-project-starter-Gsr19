library(dplyr)
data2020 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-Gsr19/main/data/2020_LA_Crime_Dataset.csv", stringsAsFactors=FALSE)
data2021 <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-Gsr19/main/data/2021_LA_Crime_Dataset.csv", stringsAsFactors=FALSE)
crime_data_2020_2021 <- full_join(data2020, data2021)

summary_info <- list()

#Total Number of Observations-- Crimes Reported/Occurred
summary_info$num_crime_observations <- nrow(crime_data_2020_2021)

#Total Crime Reported in 2020
summary_info$total_crime_2020 <- nrow(data2020)

#Total Crime Reported in 2021
summary_info$total_crime_2021 <- nrow(data2021)

#Total Number of Each Unique Crime
summary_info$unique_crime_count <- crime_data_2020_2021 %>%
  group_by(Crm.Cd.Desc) %>%
  summarize(count=n())

#Area with the Most Crime
summary_info$area_most_crimes <- crime_data_2020_2021 %>%
  group_by(AREA.NAME) %>%
  summarize(area_crimes=length(Crm.Cd)) %>%
  filter(area_crimes==max(area_crimes)) %>%
  pull(AREA.NAME)

#Proportion of Crimes without Weapons Involved
total_weapon_count <- crime_data_2020_2021 %>%
  group_by(Weapon.Desc) %>%
  summarize(count=n(), na.rm=TRUE) %>%
  summarize(sum(count))
  
na_weapon_count <- sum(is.na(crime_data_2020_2021$Weapon.Desc))

summary_info$weapon_proportion <- na_weapon_count/total_weapon_count


  


