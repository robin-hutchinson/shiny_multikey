library(tidyverse)

features <- read.csv("shiny/key/features.csv")

images <- read.csv("shiny/key/images.csv") %>%
  mutate(image = paste(as.character(image), image_type, sep = "."))

static_images <- images %>%
  filter(body_section == "Static") %>%
  mutate(row_number = row_number(),
         max = max(row_number),
        image = paste("img(src='", image, ,
                           "')", sep = ""),
        image = case_when(row_number %in% c(1,4,7,10,13,16) ~ paste("layout_column_wrap(width = 1/3,", image, ",", sep = ""),
                          row_number %in% c(3,6,9,12,15,18) ~ paste(image, "),", sep = ""),
                          TRUE ~ paste(image, ",", sep = "")
                         ),
        image = case_when(max == row_number ~ gsub(",$", ")", image),
                          TRUE ~ image))

images <- images %>%
  filter(body_section != "Static") %>%
  group_by(body_section) %>%
  mutate(row_number = row_number(),
         max = max(row_number),
        image = paste("img(src='", image, ,
                           "')", sep = ""),
        image = case_when(row_number %in% c(1,4,7,10,13,16) ~ paste("layout_column_wrap(width = 1/3,", image, ",", sep = ""),
                          row_number %in% c(3,6,9,12,15,18) ~ paste(image, "),", sep = ""),
                          TRUE ~ paste(image, ",", sep = "")
                         ),
        image = case_when(max == row_number ~ gsub(",$", ")", image),
                          TRUE ~ image))


title <- read.delim("text/title.txt", header = FALSE) 
title <- title$V1
title <- title[1]

introduction <- read.delim("text/introduction.txt", header = FALSE) 
introduction <- introduction %>%
  mutate(V1 = paste("tags$a('", V1, "'),", sep = ""))
introduction <- introduction$V1
introduction[length(introduction)] <- gsub(",", "", introduction[length(introduction)], fixed = TRUE)

instructions <- read.delim("text/instructions.txt", header = FALSE) 
instructions <- instructions %>%
  mutate(V1 = paste("tags$a('", V1, "'),tags$br(),tags$br(),", sep = ""))
instructions <- instructions$V1

key_criteria <- read.delim("text/key_criteria.txt", header = FALSE) 
key_criteria <- key_criteria %>%
  mutate(V1 = paste("tags$li('", V1, "'),", sep = ""))
key_criteria <- key_criteria$V1
key_criteria[length(key_criteria)] <- gsub(",", "", key_criteria[length(key_criteria)], fixed = TRUE)

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

                 ",
                 tags$ul(",
                
                 key_criteria,
                 ")")


full_script[length(full_script)] <- paste(full_script[length(full_script)], "),", sep = "")
  
full_script <- c(full_script, "card(", static_images$image, "),")

full_script[length(full_script)] <- paste(full_script[length(full_script)], "),", sep = "")
  
full_script <- c(full_script,                  
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

  tab_image <- images %>%
    filter(body_section == tab)
  full_script <- c(full_script, "card(", tab_image$image, "),")

full_script <- c(full_script,
                 "layout_columns(card(htmlOutput('results1')), 
                                 card(htmlOutput('results2'))))")
  
write_lines(full_script, 'shiny/ui.R')  
  
