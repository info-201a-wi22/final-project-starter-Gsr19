#ui

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")
source("source/Ip2.R")
source("source/ReportPage.R")
source("source/IP1.R")

navbarPage(
  "Crime in Los Angeles, California",
  report,
  I1,
  I2,
  interactive_3
)