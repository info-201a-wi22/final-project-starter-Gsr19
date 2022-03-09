#server

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")
source("source/Ip2.R")

# Define server logic required to draw a histogram
function(input, output) {
  dafi2 <- reactive ({
    req(input$i2year)
    req(input$i2sex)
    req(input$range)
    if(input$i2year == 2020){
      dfi2 <- twenty %>%
        filter(Age >= input$range[[1]] & Age <= input$range[[2]] & Sex == input$i2sex)  
    } else if (input$i2year == 2021) {
      dfi2 <- twenty1 %>%
        filter(Age >= input$range[[1]] & Age <= input$range[[2]] & Sex == input$i2sex)
    }
  })
  output$i2bar <- renderPlotly(
    variable <- plot_ly(data = dafi2(), x = ~Area, y = ~total, type = "bar") %>%
      layout(title = "Distribution of Crime in LA by Age and Sex",
             xaxis = list(title = "Area"),
             yaxis = list(title = "Number of Victims"))
  )
  
  
  i3_df <- reactive({
    if (input$i3year == 2020) {
      i3_tdf <- i3_by_month_2020
    } else if (input$i3year == 2021) {
      i3_tdf <- i3_by_month_2021
    }
    i3_tdf <- i3_tdf %>%
      filter(Month == input$i3month)
    return(i3_tdf)
  })
  
  output$i3_bar <- renderPlotly({
    plot_ly(
      data = i3_df(),
      x = ~reorder(Area, -count),
      y = ~count,
      type = "bar"
    ) %>%
      layout(title = "Frequency of Crime by Area in Los Angeles, California",
             xaxis = list(title = "Area Name"),
             yaxis = list(title = "Frequency of Crime"))
  })
}
