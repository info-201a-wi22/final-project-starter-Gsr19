#server

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")
source("source/Ip2.R")
source("source/IP1.R")

# Define server logic required to draw charts
function(input, output) {
  
  I1DF<- reactive ({
    req(input$I1Year)
    req(input$I1Type)
    if(input$I1Year == 2020){
      if (input$I1Type == "type1") {
        I1_data_frame <- final_DF_2020
      } else if (input$I1Type == "type2") {
        I1_data_frame <- final_DF2_2020
      }
    } else if (input$I1Year == 2021){
      if (input$I1Type == "type1") {
        I1_data_frame <- final_DF_2021
      } else if (input$I1Type == "type2") {
        I1_data_frame <- final_DF2_2021
      }
    }
  })
  
  output$I1Pie <- renderPlotly({
    plot_ly(I1DF(), labels = ~TypeOfCrime, values = ~Number, type = 'pie')%>% 
      layout(title = "Ten Common Crimes in Los Angeles, California",
             xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
             yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
  })
  
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
