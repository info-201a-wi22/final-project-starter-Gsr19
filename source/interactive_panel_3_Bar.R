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



# test_chart <- plot_ly(by_month_2021,
#                       x = ~Area,
#                       y = ~count,
#                       type = "bar")


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
        selected = "January"
      )
    ),
    mainPanel(
      plotlyOutput("i3_bar")
    )
  )
)
