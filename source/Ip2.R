library("dplyr")
library("shiny")
library("lubridate")
library("plotly")
library("ggplot2")
twenty <- read.csv("data/2020_LA_Crime_Dataset.csv")%>%
  select(Vict.Age, Vict.Sex, AREA.NAME) %>%
  filter(FALSE == is.na(Vict.Sex), FALSE == is.na(Vict.Age), FALSE == is.na(AREA.NAME)) %>%
  rename("Sex" = Vict.Sex, "Age" = Vict.Age, "Area" = AREA.NAME)%>%
  group_by(Area, Sex, Age) %>%
  summarize(total = n())
twenty1 <- read.csv("data/2021_LA_Crime_Dataset.csv")%>%
  select(Vict.Age, Vict.Sex, AREA.NAME) %>%
  filter(FALSE == is.na(Vict.Age), FALSE == is.na(Vict.Sex), FALSE == is.na(AREA.NAME)) %>%
  rename("Sex" = Vict.Sex, "Age" = Vict.Age, "Area" = AREA.NAME) %>%
  group_by(Area, Sex, Age) %>%
  summarize(total = n())
 
I2 <- tabPanel(
  "Interactive 2",
  titlePanel("Distrbution of Victims by Age, Sex, and Area"),
  sidebarLayout(
    sidebarPanel(
      p("Graph Options"),
      selectInput(
        "i2year",
        "Select Year",
        c("2020" = 2020,
          "2021" = 2021)
      ),
      selectInput(
        "i2sex",
        "Select Sex",
        c("Male" = "M",
          "Female" = "F",
          "Non-Binary" = "X")
      ),
      sliderInput("range", "Age Range:",
                  min = 1, max = 100,
                  value = c(18,55)
      ),
    ),
    mainPanel(
      plotlyOutput("i2bar"),
      p("This graph shows the amount of victims identified by a specific age range and sex in an area.
        This is to being able to see if any one specific group is being targeted in an area to see what populations are at risk.
        Allowing programs and policies to identify at risk groups in order to protect them with policies and programs.")
    )
  )
)