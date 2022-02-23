library(shiny)
library(shinydashboard)
library(shinythemes)

library(reactable)
library(htmltools)
library(readxl)
library(tidyverse)
library(kableExtra)
library(htmlwidgets)
library(webshot)


source("auxiliary/data_prep.R")
source("auxiliary/styling_functions.R")
source("auxiliary/table_function.R")

# Load data globally
data=get_data()

ui <- dashboardPage(skin="green",
  dashboardHeader(title=div(img(src="SDG_cirlcle_CMYK_no_background.png", height = 40, width = 40),"SDSN-SDG Dashboard")),
  dashboardSidebar(
    #Three Menues
    sidebarMenu(
      menuItem("About", tabName = "about", icon = icon("book-open")),
      menuItem("Dashboards", tabName = "dashboard", icon = icon("table")),
      menuItem("Download", tabName = "download", icon = icon("download"))
   )
  ),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    # Give an introduction about the project
    tabItems(
      tabItem("about",
              fluidPage(
                h1("The Sustainable Development Goals"),
                p("Developed in 2015, the ", span(strong("2030 Agenda"), style="color:#00a65a"), "forms the central international framework for sustainable development. It defines 17 goals, ", span(strong("the SDGs,"), style="color:#00a65a"), "which are assigned various indicators to track their progress.",
                  "The Sustainable Development Solutions Network,", span(strong("SDSN,"), style="color:#00a65a"), "publishes an excellent annual progress report, which you can find ", a(href="https://www.sdgindex.org/reports/", "here"),"."),
                p(),
                h3("The SDG Dashboard"),
                p("For the purpose of writing a report at work, I needed to create a simple, country specific dashboard of the SDG progress.",
                  "Since, at the time, none of the online sources matched these requirements, I decided to create my own. I share my results on this webpage, which you can browse through and download, if you like."),
                p("The code and implementation details are also available on", a(href="https://github.com/pcschreiber1/SDSN-SDG_Indicators", "GitHub"), ", please feel free to check out and re-use the code.", "For the implementation I am strongly indebted to", a(href="https://github.com/finnwoelm-sdsn", "Finn Woelm"), ", for whose interest and support I am extremely grateful.")
              )
      ),
      tabItem("dashboard",
              fluidRow(
                box(
                  # Can select from all countries from the SDSN-SDG Report
                  selectInput("country", "Country:",
                              data$Country
                              )
                )
                ),
              fluidRow(
                box(htmlOutput("table"), width=10)
              ),
              fluidRow(
                # Use the diff class for the positioning
                div(class = "col-sm-12 col-md-6 col-lg-4",
                  downloadButton('downloadData', 'Download .PNG')
                )
              )
            ),
      tabItem("download",
              fluidRow(
                box(
                  h3("Image Format"),
                  p("Here you can download a .zip file containing all country dashboards in .png format."),
                  downloadButton('downloadData_allPNG', 'Download')
                )
              ),
              fluidRow(
                box(
                  h3("HTML Format"),
                  p("Here you can download a .zip file containing all country dashboards in .html format."),
                  p(span("Due to technical difficulties the html download is currently faulty, please download directly from", style="color:red"),  a(href="https://github.com/pcschreiber1/SDSN-SDG_Indicators", "GitHub"), "."),
                  downloadButton('downloadData_allHTML', 'Download')
                )
              ),
              fluidRow(
                box(
                  p(span(strong("Note:"), style="color:orange"), "If you want to download specific dashboards only, you can do so by browsing to the country."),
                )
              )
    )
  )
  )

)

server <- function(input, output){
  output$correlation_plot <- renderPlot({
    plot(iris$Sepal.Length, iris[[input$features]],
         xlab = "Sepal Length", ylab = "Feature")
  })

  output$table <- renderUI({get_table(data[data$Country == input$country,])})

  output$downloadData <- downloadHandler(
      filename = function() {
        paste('SDSN_SDG_Dashboard',
              input$country,
              Sys.Date(), '.png', sep='_')
      },
      content = function(con) {
        # save_html(get_table(data[data$Country == input$country,]),
        #          con)#(data, con)
        file.copy(paste("files/image/", input$country, "_snapshot.png", sep=""), con)
      }
    )
  
  output$downloadData_allPNG <- downloadHandler(
    filename = function() {
      paste('SDSN_SDG_Dashboard_images',
            Sys.Date(), '.zip', sep='_')
    },
    content = function(con) {
      # save_html(get_table(data[data$Country == input$country,]),
      #          con)#(data, con)
      file.copy("files/all_images.zip", con)
    }
  )
  
  output$downloadData_allHTML <- downloadHandler(
    filename = function() {
      paste('SDSN_SDG_Dashboard_html',
            Sys.Date(), '.zip', sep='_')
    },
    content = function(con) {
      # save_html(get_table(data[data$Country == input$country,]),
      #          con)#(data, con)
      file.copy("files/all_htmls.zip", con)
    }
  )
}

shinyApp(ui, server)
