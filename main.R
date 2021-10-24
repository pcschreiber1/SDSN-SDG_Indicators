# Imports
library(reactable)
library(htmltools)
library(readxl)
library(tidyverse)


source("auxiliary/styling_functions.R")

# Load data
##data <- read_xlsx("data/SDR 2021 - Database.xlsx", sheet = "Overview")

##country <- data[data$Country == "Finland", ]

data <- read_xlsx("data/SDR 2021 - Database.xlsx", sheet = "SDR2021 Data")



#code missing values as NA
#Subset columns
data <- data[data$Country == "Finland", 5:43]
data[,29] = "\U2800"

#First Section: SDGs 1:6
Part1 <- reactable(
  data[1:1, 6:17],
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
  data[1:1, 18:29],
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
  data[1:1, 30:39],
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
             h2(class = "header", "Finland"),
             div(class = "line-score", Part1),
             div(class = "box-score-title", Part2),
             div(class = "box-score-title", Part3)
)

# Print html file
htmltools::html_print(table)