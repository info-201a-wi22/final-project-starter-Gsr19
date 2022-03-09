library(shiny)
library(ggplot2)
library(maps)
library(plotly)

summary <- tabPanel(
  "Summary",
  h1("Summary"),
  fluidPage(
    tags$style('.container-fluid {
                           background-color: #ADD8E6;
            }'),
    tags$head(tags$style(HTML('* {font-family: "Comic Sans"};'))),
    p("As you can see, our data had a lot of different variables that we could have worked with. After data wrangling
      and creating different plots and charts, there were three major takeaways:"),
    p("
      "),
    strong("1. In both 2020 and 2021, stolen vehicles were the most common crimes in Los Angeles, followed by simple assault."),
    p("
      "),
    p("As you can see in our first plot, we included a pie chart displaying the percentages of the top 10 most common crime sin Los
      Angeles. In 2020, about 16.5% of crimes were stolen vehicles, whereas simple assault was the second most common with 13%,
      and the third most common was vandalism felonies."),
    p("
      "),
    strong("2. The most crimes in the year of 2020 occurred in the month of January."),
    p("
      "),
    p("In our third plot, we wanted to take a look at the amount of crime occurrences in different months. January happens to have 
    the most crime occurrences reported in both 2020 and 2021. With many people visiting Los Angeles for vacation, it may be important 
    to see which times are the most safe to go."),
    p("
      "),
    strong("3. The three areas in Los Angeles with the most crime occurences (in order) were 77th Street, Pacific, and Central."),
    p("
      "),
    p("Also pulled from our third plot, we can see the different areas on the x-axis, where we can compare the different number of 
      crime occurrences by area. The amount of crimes in the different areas does change every month. However, 77th Street is 
      consistently the area with the most crime occurrences in the year, followed by Pacific and Central."),
    p("
      "),
    p("Overall, there can be a lot of different values extracted from this dataset depending on the variables that one may want to look at.
      We made three interactive plots that are insightful for users to look at and change the different variables that they are lookign at.
      The most important data point discovered was that nonviolent crime makes up the majority of the crime in Los Angeles and can be solved 
      with surveillance and policy changes."),
    p("
      "),
    img(src = "https://i.natgeofe.com/n/5b92e90e-b3f4-4938-8f7b-3db2410d3de2/los-angles-travel_2x3.jpg",
        width="40%", height="40%"),
))
