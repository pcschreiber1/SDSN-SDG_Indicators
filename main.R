# Imports
library(reactable)
library(htmltools)
library(readxl)
library(tidyverse)
library(kableExtra)
library(htmlwidgets)
library(webshot)

source("auxiliary/data_prep.R")
source("auxiliary/table_function.R")

# Load data
data <- get_data()

for(i in data$Country){
  #Define and reset the counter after every run
  SDG_counter <- 1
  country = data[data$Country == i,]
  table <- get_table(country)
  
  #Create file name
  f_html_name <- paste("files/", country$Country, "_snapshot.html", sep="")
  f_png_name <- paste("files/", country$Country, "_snapshot.png", sep="")
  
  #Save output
  save_html(table, f_html_name)
  webshot(f_html_name, f_png_name) # you can also export to pdf
}

## Print html table in console
#htmltools::html_print(table)
