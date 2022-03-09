library("shiny")
library("plotly")
library("scales")

LA_2020_full_crime_data <- read.csv("data/2020_LA_Crime_Dataset.csv")
LA_2020_crime_desc <- data.frame(LA_2020_full_crime_data$Crm.Cd.Desc)
LA_2021_full_crime_data <- read.csv("data/2021_LA_Crime_Dataset.csv")
LA_2021_crime_desc <- data.frame(LA_2021_full_crime_data$Crm.Cd.Desc)

LA_2020_num_of_each_crime <- table(LA_2020_crime_desc$LA_2020_full_crime_data.Crm.Cd.Desc)
LA_2020_crime_num_df <- as.data.frame(LA_2020_num_of_each_crime)
LA_2021_num_of_each_crime <- table(LA_2021_crime_desc$LA_2021_full_crime_data.Crm.Cd.Desc)
LA_2021_crime_num_df <- as.data.frame(LA_2021_num_of_each_crime)

attach(LA_2020_crime_num_df)

ordered_LA_2020_combined_crime_nums <- LA_2020_crime_num_df[order(-Freq),]
ordered_LA_2020_combined_crime_nums_final <- ordered_LA_2020_combined_crime_nums[1:10, 1:2]
ordered_LA_2020_combined_crime_nums_final <- rename(ordered_LA_2020_combined_crime_nums_final, TypeOfCrime = Var1)
ordered_LA_2020_combined_crime_nums_final <- rename(ordered_LA_2020_combined_crime_nums_final, Number = Freq)

least_ordered_LA_2020_combined_crime_nums <- LA_2020_crime_num_df[order(Freq),]
least_ordered_LA_2020_combined_crime_nums_final <- least_ordered_LA_2020_combined_crime_nums[1:10, 1:2]
least_ordered_LA_2020_combined_crime_nums_final <- rename(least_ordered_LA_2020_combined_crime_nums_final, TypeOfCrime = Var1)
least_ordered_LA_2020_combined_crime_nums_final <- rename(least_ordered_LA_2020_combined_crime_nums_final, Number = Freq)

attach(LA_2021_crime_num_df)

ordered_LA_2021_combined_crime_nums <- LA_2021_crime_num_df[order(-Freq),]
ordered_LA_2021_combined_crime_nums_final <- ordered_LA_2021_combined_crime_nums[1:10, 1:2]
ordered_LA_2021_combined_crime_nums_final <- rename(ordered_LA_2021_combined_crime_nums_final, TypeOfCrime = Var1)
ordered_LA_2021_combined_crime_nums_final <- rename(ordered_LA_2021_combined_crime_nums_final, Number = Freq)

least_ordered_LA_2021_combined_crime_nums <- LA_2021_crime_num_df[order(Freq),]
least_ordered_LA_2021_combined_crime_nums_final <- least_ordered_LA_2021_combined_crime_nums[1:10, 1:2]
least_ordered_LA_2021_combined_crime_nums_final <- rename(least_ordered_LA_2021_combined_crime_nums_final, TypeOfCrime = Var1)
least_ordered_LA_2021_combined_crime_nums_final <- rename(least_ordered_LA_2021_combined_crime_nums_final, Number = Freq)

final_DF_2020 <- ordered_LA_2020_combined_crime_nums_final
final_DF2_2020 <- least_ordered_LA_2020_combined_crime_nums_final
final_DF_2021 <- ordered_LA_2021_combined_crime_nums_final
final_DF2_2021 <- least_ordered_LA_2021_combined_crime_nums_final

I1 <- tabPanel(
  "Interactive 1",
  titlePanel("Most & Least Common Crimes across LA"),
  sidebarLayout(
    sidebarPanel(
      p("Graph Options"),
      selectInput(
        "I1Year",
        "Select Year",
        c("2020" = 2020,
          "2021" = 2021)
      ),
      selectInput(
        "I1Type",
        "Select Type",
        c("Most Common Crimes" = "type1",
          "Least Common Crimes" = "type2")
      ),
    ),
    mainPanel(
      plotlyOutput("I1Pie"),
      p("This chart illustrates the proportion of each unique crime reported & shows the most and least common crimes in 2020 and 2021. 
        It attempts to answer our first research question of \"What are the most common crimes that occur in Los Angeles, CA?\"
        and also go further by looking at the least common crimes in Los Angeles, CA as well.
        From this chart we can see that for both 2020 and 2021 the most common crime was Stolen Vehicles, but only being ahead of other crimes by a small margin.
        However for 2020 we can see that multiple crimes (which are pretty different in nature) are pretty close for the least common crime 
        and for 2021 we can see that multiple crimes (which are pretty different in nature) are tied for the least common crime.
        ")
    )
  )
)