# This file contains auxiliary functions for importing 
# and preparing the data
# -----------------------------------------------------

library(readxl)
library(tidyverse)

get_data <- function(){
  data <- read_xlsx("data/SDR 2021 - Database.xlsx", sheet = "SDR2021 Data")
  
  #Only maintaining relevant columns
  data  <- data[,c(2,10:43)]
  ## This way creates dots in Column Names
  #data <- data.frame("Country" = data$Country, data[,10:43])
  
  ## Convert NA to empty Unicode
  data %>% mutate(across(where(is.factor), as.character)) # need to convert all columns to characers
  data[is.na(data)] = "\U2800"
  
  #Drop Regions in Country column
  ## to-do change hardcoding
  data <- data[1:193,]
  
  
  return(data)  
}


