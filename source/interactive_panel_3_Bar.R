library(shiny)
library(lubridate)
library(plotly)

i3_data_2020 <- read.csv("data/2020_LA_Crime_Dataset.csv") %>%
  select(DATE.OCC, AREA.NAME) %>%
  mutate(date = substr(DATE.OCC, 1, 10)) %>%
  mutate(Month = month(mdy(date)))

i3_data_2021 <- read.csv("data/2021_LA_Crime_Dataset.csv") %>%
  select(DATE.OCC, AREA.NAME) %>%
  mutate(date = substr(DATE.OCC, 1, 10)) %>%
  mutate(Month = month(mdy(date)))


i3_by_month_2021 <- i3_data_2021 %>%
  rename("Area" = AREA.NAME) %>%
  group_by(Month, Area) %>%
  summarise(count = n())

i3_by_month_2020 <- i3_data_2020 %>%
  rename("Area" = AREA.NAME) %>%
  group_by(Month, Area) %>%
  summarise(count = n())


interactive_3 <- tabPanel(
  "Interactive 3",
  titlePanel("Crime Frequency by Area"),
  sidebarLayout(
    sidebarPanel(
      p("Graph Options"),
      selectInput(
        inputId = "i3year",
        "Select Year",
        c("2020" = 2020,
          "2021" = 2021),
        selected = "2021"
      ),
      selectInput(
        inputId = "i3month",
        "Select Month",
        c("January" = 1,
          "February" = 2,
          "March" = 3,
          "April" = 4,
          "May" = 5,
          "June" = 6,
          "July" = 7,
          "August" = 8,
          "September" = 9,
          "October" = 10,
          "November" = 11,
          "December" = 12),
        selected = 1
      )
    ),
    mainPanel(
      plotlyOutput("i3_bar"),
      p("The chart above shows data from January, 2020 through June, 2021.
        The question we are trying to answer with this chart is: Which area in Los Angeles has the
        most crimes that were reported?
        The purpose of this chart is to show how many crimes were reported in each of the different
        areas of Los Angeles. We put the areas in order from area with most occurrences to least occurrences.
        By looking at the different areas, people are able to see where they are most safe in Los Angeles,
        and where there needs to be more regulation and awareness.
        From this chart, we can see that the area with the most crime is often in 77th Street,
        whereas the area with the least crimes quite consistently is Foothill. The top 3 areas that had
        the most crime occurrences were 77th Street, Pacific, and Central.")
    )
  )
)
