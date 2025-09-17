library(tidyverse)

features <- read.csv("shiny/key/features.csv")

images <- read.csv("shiny/key/images.csv") %>%
  mutate(image = paste(as.character(image), image_type, sep = "."))


title <- read.delim("text/title.txt", header = FALSE) 
title <- title$V1
title <- title[1]

introduction <- read.delim("text/introduction.txt", header = FALSE) 
introduction <- introduction %>%
  mutate(V1 = paste("tags$a('", V1, "'),tags$br(),tags$br(),", sep = ""))
introduction <- introduction$V1
introduction[length(introduction)] <- gsub(",tags$br(),tags$br(),", "", introduction[length(introduction)], fixed = TRUE)

instructions <- read.delim("text/instructions.txt", header = FALSE) 
instructions <- instructions %>%
  mutate(V1 = paste("tags$a('", V1, "'),tags$br(),tags$br(),", sep = ""))
instructions <- instructions$V1

full_script <- c("library(shiny)
install.packages('munsell')
library(bslib)
library(DT)
library(knitr)
library(kableExtra)
library(tidyverse)

ui <- bslib::page_fluid(tags$h1('",

                 title,
                 
                 "'),
                 tags$br(), # line break
                 layout_columns(card(",
                                       
                 introduction,
                 
                 "),
                   card(img(src='100.jpeg', width = 250)) ),",
                  instructions,
                 
                 "navset_card_underline(")

sections <- unique(features$body_section)

for(i in 1:length(sections)){
  
  tab <- sections[i]
  full_script <- c(full_script,
                   paste("nav_panel('", tab, "',
                           layout_columns(card(", sep = ""))
  
  tabs <- features %>%
    filter(body_section == tab)
  
  parts <- unique(tabs$body_part)
  
  for(j in 1:length(parts)){
    
    part <- parts[j]
    tab_part <- tabs %>%
      filter(body_part == part)
    q <- unique(tab_part$question)
    as <- unique(tab_part$answer)
    full_script <- c(full_script,
                     paste("radioButtons('",part,"', '",
                           q[1], "', choices = c(", sep = ""))
    
    for(k in 1:(length(as)-1)) {
      
      full_script <- c(full_script, 
                       paste("'", as[k], "', ", sep = ""))
      
    }
    
    full_script <- c(full_script, 
                     paste("'", as[length(as)], "'), selected = character(0)),", sep = ""))

  }

  full_script[length(full_script)] <- gsub(",$", "),", full_script[length(full_script)])
  full_script <- c(full_script, "card(")
  tab_image <- images %>%
    filter(body_section == tab)
  if(nrow(tab_image) >= 1) {
  ims <- unique(tab_image$image)
  
  for(m in 1:length(ims)) {
    
    full_script <- c(full_script, 
                     paste("img(src='",
                           ims[m],
                           "', width = 250),", sep = ""))
    
  }
  
  full_script[length(full_script)] <- gsub(",$", "),col_widths = c(4, 8)))", full_script[length(full_script)])
  
  
  } else {  full_script <- c(full_script, ")))")}
  
  full_script <- c(full_script, ",")
  
}

full_script[length(full_script)-1] <- paste(full_script[length(full_script)-1], ")", sep = "")

full_script <- c(full_script,
                 "layout_columns(card(htmlOutput('results1')), 
                                 card(htmlOutput('results2'))))")
  
write_lines(full_script, 'shiny/ui.R')  
  
