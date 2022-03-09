library(shiny)
library(ggplot2)
library(maps)
library(plotly)

introduction <- tabPanel(
  "Introduction",
  fluidRow(
    h1("Crime in Los Angeles, California"),
    h2("by Tiffani Pham, Garrett Ruth, Aswin Sundar, and Sonic Yao"),
    h3("Introduction"),
    p("Los Angeles, California is one the world's most famous cities, known for being the home of many rich and successful celebrities and 
      major entertainment companies. However, little do people know that there is a lot of crime that occurs in Los Angeles.
      Crime rates are continuing to increase, which is a problem that needs to be addressed as soon as possible.
      For this project, as a group, we dove into Los Angeles crime data from 2020 up until now. Our main objective is to 
      extract from the dataset which crimes are the most common and likely to happen while also looking into why these 
      crimes occur. With the uprise in crimes, it is important that we are helping out the key stakeholders to be aware 
      of these crimes in order to prevent them from occurring and how to deal with them. We want to help create a safer 
      community in Los Angeles, whereas there is a population of almost 4 million people, with many tourists going in and 
      out of the city as well."),
    h3("Questions We Want To Answer:"),
    tags$ol(
      tags$li("What are the most common crimes that occur in Los Angeles, CA and why?"),
      tags$li("Which months of the year have the most crimes that were reported?"),
      tags$li("Which area in Los Angeles has the most crimes?")
    ),
    p("
      "),
    img(src = "https://cms.finnair.com/resource/blob/1397898/c4410bf39d8838d7285bc25be6d4183b/lax-main-data.jpg",
        width="75%", height="75%"))
)