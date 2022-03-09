#ui

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")
source("source/Ip2.R")
source("source/ReportPage.R")

navbarPage(
  "Crime in Los Angeles, California",
  report,
  I2,
  interactive_3
)