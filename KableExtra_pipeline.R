# Imports
library(htmltools)
library(readxl)
library(tidyverse)
library(kableExtra)
library(formattable)

# Load data
##data <- read_xlsx("data/SDR 2021 - Database.xlsx", sheet = "Overview")

##country <- data[data$Country == "Finland", ]

data <- read_xlsx("data/SDR 2021 - Database.xlsx", sheet = "SDR2021 Data")



#code missing values as NA
#Subset columns
data <- data[data$Country == "Finland", 5:43]
data[,29] = "\U2800"


#First Section: SDGs 1:6

#http://cran.nexr.com/web/packages/kableExtra/vignettes/use_kableExtra_with_formattable.html

Part1 <- kbl(data[1:1, 6:17],
                    booktabs = T,
                    format="html",
                    col.names = NULL) %>%
  column_spec(1, 
              background = "GREEN",
              #Defining the image
              image = "https://dashboards.sdgindex.org/static/goals/icons/sdg1-white.svg") %>%
  column_spec(2, 
              background = "GREEN",
              #Defining the image
              image = "https://dashboards.sdgindex.org/static/goals/icons/sdg2-white.svg")
     
Part2 <- kbl(data[1:1, 18:29],
             booktabs = T,
             format="html",
             col.names = NULL) %>%
  column_spec(1, 
              background = "GREEN",
              #Defining the image
              image = "https://dashboards.sdgindex.org/static/goals/icons/sdg7-white.svg") %>%
  column_spec(2, 
              background = "GREEN",
              #Defining the image
              image = "https://dashboards.sdgindex.org/static/goals/icons/sdg8-white.svg")

Part3 <- kbl(data[1:1, 30:39],
             booktabs = T,
             format="html",
             col.names = NULL) %>%
  mutate(
    Goal.1.Dash = cell_spec(Goal.1.Dash, "html", color = "GREEN"))
  
  
  
  column_spec(1, 
              background = "GREEN",
              #Defining the image
              image = "https://dashboards.sdgindex.org/static/goals/icons/sdg11-white.svg") %>%
  column_spec(2, 
              background = "GREEN",
              #Defining the image
              image = "https://dashboards.sdgindex.org/static/goals/icons/sdg12-white.svg")


# Creae single Html file
table <- div(class = "box-score",
             h2(class = "header", "Finland"),
             div(class = "line-score", Part1),
             div(class = "box-score-title", Part2),
             div(class = "box-score-title", Part3)
)


# Print html file
htmltools::html_print(Part1)

table

save_kable(Part1, "kable_save_kable_test.png")

kable(table)
    