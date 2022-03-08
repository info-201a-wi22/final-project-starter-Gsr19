#server

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")


# Define server logic required to draw a histogram
function(input, output) {
  
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
      x = ~Area,
      y = ~count,
      type = "bar"
    ) %>%
      layout(title = "Frequency of Crime by Area in Los Angeles, California",
             xaxis = list(title = "Area Name"),
             yaxis = list(title = "Frequency of Crime"))
  })
}
