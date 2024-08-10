library(shiny)
library(DT)
library(tidyverse)

features <- read.csv("key/features.csv")
server <- function(input, output) {
  
   features_absent <- reactive({
     
     g <- features
     
     if(!is.null(input$vein_3_fork)) {
       
       g <- g %>%
         filter(body_part == "Vein 3"& meaning != input$vein_3_fork) 
       
       
     } 
     
     unique(g$genus)
     
   })

  output$results <- renderDataTable(

    features %>%
      filter(!(genus %in% features_absent())) %>%
      distinct(genus) %>%
      arrange(genus)%>%
      rename("Possible genera are" = genus) 

   ,
   rownames = FALSE)
  
  
}
