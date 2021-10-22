library(reactable)
library(htmltools)
library(readxl)
library(kableExtra)

# Convert arrows to unicode for R
# See: https://www.compart.com/en/unicode/U+2191
UP_ARROW <- "\U2191"
TOP_RIGHT_ARROW <- "\U279A"
RIGHT_ARROW <- "\U2192"

# Define colors
# Colors picked from dashboards.sdgindex.org using eye dropper
# See: https://browsertouse.com/blog/2501/use-firefox-eyedropper-color-picker-tool/
GREEN <- "#43a047"
YELLOW <- "#fcc30b"
ORANGE <- "#f57c00"
RED <- "#d32f2f"
# GRAY <- TODO

# Get background color for country rating
get_background_color <- function(value) {
  if (value == "green") return(GREEN)
  if (value == "yellow") return(YELLOW)
  if (value == "orange") return(ORANGE)
  if (value == "red") return(RED)
  # if (value == "gray) TODO
}

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
  # etc... TODO
  
  # Render as SVG icon
  return(
    htmltools::tags$svg(
      htmltools::tags$path(d = d_path, fill = color),
      viewBox="0 0 24 24",
      style = list(height = 100, width = 50, padding = "16px 0")
    )
  )
}

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
    `Goal 1 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg1-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 1 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 2 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background color comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg2-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 2 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 3 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg3-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 3 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 4 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg4-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 4 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 5 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg5-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 5 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 6 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg6-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 6 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    })
  ),
  theme = reactableTheme(
    # Disable cell padding, so that our SDG icons fill the entire cell
    cellPadding = "0",
  )
)

#Second Section: SDGs 7:12
#-----
Part2 <- reactable(
  data[1:1, 18:28],
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
    `Goal 7 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg7-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 7 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 8 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg8-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 8 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 9 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg9-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 9 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 10 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg10-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 10 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 11 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg11-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 11 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 12 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg12-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
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
  defaultColDef = colDef(
    minWidth = 100,
    maxWidth = 100,
    style = function(value) {
      list(background = get_background_color(value))
    }
  ),

  columns = list(
    #html tools
    `Goal 13 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg13-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 13 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 14 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg14-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 14 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 15 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg15-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 15 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 16 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg16-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 16 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
    }),
    `Goal 17 Dash`= colDef(header = function(value) {
      tags$a(display=FALSE)
    },
    # Replace cell contents with white SDG icon
    # The background comes from the `defaultColDef`
    cell = function(value) {
      img(
        # Get the URL by right-clicking on the SDG icon on
        # dashboards.sdgindex.org and selecting "Copy image link"
        src = "https://dashboards.sdgindex.org/static/goals/icons/sdg17-white.svg",
        style = list(width = 100, height = 100, display = 'block')
      )
    }),
    `Goal 17 Trend`= colDef(header = function(value) {
      tags$a(display=FALSE)
    }, 
    minWidth = 50,
    maxWidth = 50,
    cell = function(value) {
      render_arrow(value)
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

