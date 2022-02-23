# This file contains auxiliary functions for styling 
# used in main.R
# -----------------------------------------------------

#Imports
library(reactable)
library(htmltools)

# Convert arrows to unicode for R
# See: https://www.compart.com/en/unicode/U+2191
UP_ARROW <- "\U2191"
TOP_RIGHT_ARROW <- "\U279A"
RIGHT_ARROW <- "\U2192"
BOTTOM_ARROW <- "\U2193"
NO_INFO <- "\U2800"

# Define colors
# Colors picked from dashboards.sdgindex.org using eye dropper
# See: https://browsertouse.com/blog/2501/use-firefox-eyedropper-color-picker-tool/
GREEN <- "#43a047"
YELLOW <- "#fcc30b"
ORANGE <- "#f57c00"
RED <- "#d32f2f"
GREY <- "#bdbdbd"


# Get background color for country rating
get_background_color <- function(value) {
  if (value == "green") return(GREEN)
  if (value == "yellow") return(YELLOW)
  if (value == "orange") return(ORANGE)
  if (value == "red") return(RED)
  if (value == "grey") return(GREY)
}

#Rendering arrows
render_arrow <- function(value) {
  # d describes the path/shape of the arrow
  # Comes from materialdesignicons.com, for example top-right arrow:
  # 1) https://materialdesignicons.com/icon/arrow-top-right-thick
  # 2) View SVG
  # 3) Copy the d portion
  d_path = ""
  # color sets the color of the arrow
  color = ""
  
  if (value == UP_ARROW) {
    d_path = "M14,20H10V11L6.5,14.5L4.08,12.08L12,4.16L19.92,12.08L17.5,14.5L14,11V20Z"
    color = GREEN
  }
  if (value == TOP_RIGHT_ARROW) {
    d_path = "M8.5,18.31L5.69,15.5L12.06,9.12H7.11V5.69H18.31V16.89H14.89V11.94L8.5,18.31Z"
    color = YELLOW
  }
  if (value == RIGHT_ARROW) {
    d_path = "M4,10V14H13L9.5,17.5L11.92,19.92L19.84,12L11.92,4.08L9.5,6.5L13,10H4Z"
    color = ORANGE
  }
  if (value == BOTTOM_ARROW) {
    d_path = "M10,4H14V13L17.5,9.5L19.92,11.92L12,19.84L4.08,11.92L6.5,9.5L10,13V4Z"
    color = RED
  }
  if (value == NO_INFO) {
    d_path = "M12,10A2,2 0 0,0 10,12C10,13.11 10.9,14 12,14C13.11,14 14,13.11 14,12A2,2 0 0,0 12,10Z"
    color = GREY
  }
  
  # Render as SVG icon
  return(
    htmltools::tags$svg(
      htmltools::tags$path(d = d_path, fill = color),
      viewBox="0 0 24 24",
      style = list(height = 100, width = 50, padding = "16px 0")
    )
  )
}

## Reactable
# --------------------------------
# Formatting pipeline for reactable:
# Creates a list of: `{column name}` = SDG_Dash/Trend
column_list <- function(data #already subsetted to only include relevant columns
                        ){
  #Create list of relevnt column names
  columns <- colnames(data)
  
  c_list <- list()
  for(column in columns){
    list.append(c_list, column = SDG_Dash)
  }
}

#Logo URL
get_logo_URL <- function(column_name){
  #Sub-function in SDG_DSH
  
  #counting forwards
  URL = paste("https://dashboards.sdgindex.org/static/goals/icons/sdg",
              SDG_counter,
              "-white.svg", sep="")
  SDG_counter <<- SDG_counter + 1 #Using global assignment operator
  return(URL)
}

#Create cell with SDG logo
SDG_Dash <- function(){
  #Creates Column
  column_definition <- colDef(
  header = function(value) {
  tags$a(display=FALSE) #to hide column name
},
# Replace cell contents with white SDG icon
# The background comes from the `defaultColDef`
  cell = function(value) {
  img(
    # Get the URL by right-clicking on the SDG icon on
    # dashboards.sdgindex.org and selecting "Copy image link"
    src = get_logo_URL(value),
    style = list(width = 100, height = 100, display = 'block')
  )
})
}

# Create cell with SDG Trend
SDG_Trend <- colDef(
    header = function(value) {
    tags$a(display=FALSE) # To hide column name
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
    render_arrow(value)
  })

