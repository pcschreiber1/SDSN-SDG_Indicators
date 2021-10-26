# This file contains auxiliary functions for creating
# the dashboard
# -----------------------------------------------------

library(reactable)
library(htmltools)
library(readxl)
library(tidyverse)
library(kableExtra)

source("auxiliary/styling_functions.R")

get_table <- function(country){
  # Creates three reactable tables
  # and stacks them on top of each other
  #
  #Input: Country data (first column country name)
  #Output: html dashboard
  
  #First Section: SDGs 1:6
  Part1 <- reactable(
    country[, 2:13],
    # Styling
    showPageInfo = FALSE,
    pagination = FALSE,
    borderless = TRUE,
    defaultColDef = colDef(
      minWidth = 100,
      maxWidth = 100,
      style = function(value) {
        list(background = get_background_color(value))
      }
    ),
    columns = list(
      #html tools
      `Goal 1 Dash`= SDG_Dash(),
      `Goal 1 Trend`= SDG_Trend,
      `Goal 2 Dash`= SDG_Dash(),
      `Goal 2 Trend`= SDG_Trend,
      `Goal 3 Dash`= SDG_Dash(),
      `Goal 3 Trend`= SDG_Trend,
      `Goal 4 Dash`= SDG_Dash(),
      `Goal 4 Trend`= SDG_Trend,
      `Goal 5 Dash`= SDG_Dash(),
      `Goal 5 Trend`= SDG_Trend,
      `Goal 6 Dash`= SDG_Dash(),
      `Goal 6 Trend`= SDG_Trend
    ),
    theme = reactableTheme(
      # Disable cell padding, so that our SDG icons fill the entire cell
      cellPadding = "0",
    ))
  
  #Second Section: SDGs 7:12
  #-----
  Part2 <- reactable(
    country[, 14:25],
    # Styling
    showPageInfo = FALSE,
    pagination = FALSE,
    borderless = TRUE,
    defaultColDef = colDef(
      minWidth = 100,
      maxWidth = 100,
      style = function(value) {
        list(background = get_background_color(value))
      }
    ),
    columns = list(
      #html tools
      `Goal 7 Dash`= SDG_Dash(),
      `Goal 7 Trend`= SDG_Trend,
      `Goal 8 Dash`= SDG_Dash(),
      `Goal 8 Trend`= SDG_Trend,
      `Goal 9 Dash`= SDG_Dash(),
      `Goal 9 Trend`= SDG_Trend,
      `Goal 10 Dash`= SDG_Dash(),
      `Goal 10 Trend`= SDG_Trend,
      `Goal 11 Dash`= SDG_Dash(),
      `Goal 11 Trend`= SDG_Trend,
      `Goal 12 Dash`= SDG_Dash(),
      `Goal 12 Trend`= SDG_Trend
    ),
    theme = reactableTheme(
      # Disable cell padding, so that our SDG icons fill the entire cell
      cellPadding = "0",
    )
  )
  
  #Third section: SDGs 13:17
  #-----
  Part3 <- reactable(
    country[, 26:35],
    # Styling
    showPageInfo = FALSE,
    pagination = FALSE,
    borderless = TRUE,
    defaultColDef = colDef(
      minWidth = 100,
      maxWidth = 100,
      style = function(value) {
        list(background = get_background_color(value))
      }
    ),
    columns = list(
      #html tools
      `Goal 13 Dash`= SDG_Dash(),
      `Goal 13 Trend`= SDG_Trend,
      `Goal 14 Dash`= SDG_Dash(),
      `Goal 14 Trend`= SDG_Trend,
      `Goal 15 Dash`= SDG_Dash(),
      `Goal 15 Trend`= SDG_Trend,
      `Goal 16 Dash`= SDG_Dash(),
      `Goal 16 Trend`= SDG_Trend,
      `Goal 17 Dash`= SDG_Dash(),
      `Goal 17 Trend`= SDG_Trend
    ),
    theme = reactableTheme(
      # Disable cell padding, so that our SDG icons fill the entire cell
      cellPadding = "0",
    )
  )
  
  # Creae single Html file
  table <- div(class = "box-score",
               h2(class = "header", data[1:1, 1]),
               div(class = "line-score", Part1),
               div(class = "box-score-title", Part2),
               div(class = "box-score-title", Part3)
  )
  
  return(table)
}