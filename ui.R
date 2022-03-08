#ui

library(shiny)
library(dplyr)

source("source/interactive_panel_3_Bar.R")


navbarPage(
  "Crime in Los Angeles, California",
  interactive_3
)