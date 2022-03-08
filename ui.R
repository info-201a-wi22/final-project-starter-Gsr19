#ui

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")
source("source/Ip2.R")

navbarPage(
  "Crime in Los Angeles, California",
  I2,
  interactive_3
)