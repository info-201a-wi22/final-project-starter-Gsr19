#ui

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")
source("source/Ip2.R")
source("source/ReportPage.R")
source("source/IP1.R")
source("source/introduction.R")
source("source/Summary_Page.R")

navbarPage(
  "Welcome!",
  introduction,
  I1,
  I2,
  interactive_3,
  summary,
  report
)