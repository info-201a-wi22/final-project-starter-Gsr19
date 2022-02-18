library("ggplot2")
library("dplyr")

LA_2020_full_crime_data <- read.csv("2020_LA_Crime_Dataset.csv")
LA_2020_crime_desc <- data.frame(LA_2020_full_crime_data$Crm.Cd.Desc)

LA_2021_full_crime_data <- read.csv("2021_LA_Crime_Dataset.csv")
LA_2021_crime_desc <- data.frame(LA_2021_full_crime_data$Crm.Cd.Desc)

LA_2020_num_of_each_crime <- table(LA_2020_crime_desc$LA_2020_full_crime_data.Crm.Cd.Desc)
LA_2021_num_of_each_crime <- table(LA_2021_crime_desc$LA_2021_full_crime_data.Crm.Cd.Desc)

LA_2020_crime_num_df <- as.data.frame(LA_2020_num_of_each_crime)
LA_2021_crime_num_df <- as.data.frame(LA_2021_num_of_each_crime)

LA_2020_21_crime_nums <- rbind(LA_2020_crime_num_df, LA_2021_crime_num_df)
LA_2020_21_combined_crime_nums <- aggregate(. ~  Var1, data = LA_2020_21_crime_nums, sum)

attach(LA_2020_21_combined_crime_nums)
ordered_LA_2020_21_combined_crime_nums <- LA_2020_21_combined_crime_nums[order(-Freq),]
ordered_LA_2020_21_combined_crime_nums_final <- ordered_LA_2020_21_combined_crime_nums[1:10, 1:2]

ordered_LA_2020_21_combined_crime_nums_final <- rename(ordered_LA_2020_21_combined_crime_nums_final, TypeOfCrime = Var1)
ordered_LA_2020_21_combined_crime_nums_final <- rename(ordered_LA_2020_21_combined_crime_nums_final, Number = Freq)

final_DF <- ordered_LA_2020_21_combined_crime_nums_final

ggplot(final_DF, aes(x="", y=Number, fill=TypeOfCrime)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void() +
  ggtitle("Ten Most Common Crimes in LA in 2020-21") +
  scale_fill_discrete(name = "Type Of Crime")


