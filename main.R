# Imports
library(reactable)
library(htmltools)
library(readxl)

source("auxiliary/styling_functions.R")

# Load data
data <- read_xlsx("data/SDR 2021 - Database.xlsx", sheet = "Overview")

country <- data[data$Country == "Finland", ]

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
  data[1:1, 18:28],
  # Styling
  showPageInfo = FALSE,
  pagination = FALSE,
  borderless = TRUE,
  
  # Create Colun Groups
  columnGroups = list(
    colGroup(name = "SDG 7", columns = c("Goal 7 Dash", "Goal 7 Trend")),
    colGroup(name = "SDG 8", columns = c("Goal 8 Dash", "Goal 8 Trend")),
    colGroup(name = "SDG 9", columns = c("Goal 9 Dash", "Goal 9 Trend")),
    colGroup(name = "SDG 10", columns = c("Goal 10 Dash", "Goal 10 Trend")),
    colGroup(name = "SDG 11", columns = c("Goal 11 Dash", "Goal 11 Trend")),
    colGroup(name = "SDG 12", columns = c("Goal 12 Dash"))#, "Goal 12 Trend"))
  ),
  columns = list(
    #html tools
    `Goal 7 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 7 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 8 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 8 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 9 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 9 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 10 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 10 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 11 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 11 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 12 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    })#,
    #`Goal 12 Trend`= colDef(header = function(value) {
    #  tags$a(display=FALSE)
    #})
  )
  
)

#Third section: SDGs 13:17
#-----
Part3 <- reactable(
  data[1:1, 29:38],
  # Styling
  showPageInfo = FALSE,
  pagination = FALSE,
  borderless = TRUE,
  
  # Create Colun Groups
  columnGroups = list(
    colGroup(name = "SDG 13", columns = c("Goal 13 Dash", "Goal 13 Trend")),
    colGroup(name = "SDG 14", columns = c("Goal 14 Dash", "Goal 14 Trend")),
    colGroup(name = "SDG 15", columns = c("Goal 15 Dash", "Goal 15 Trend")),
    colGroup(name = "SDG 16", columns = c("Goal 16 Dash", "Goal 16 Trend")),
    colGroup(name = "SDG 17", columns = c("Goal 17 Dash", "Goal 17 Trend"))
  ),
  columns = list(
    #html tools
    `Goal 13 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 13 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 14 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 14 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 15 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 15 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 16 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 16 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 17 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }),
    `Goal 17 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    })
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