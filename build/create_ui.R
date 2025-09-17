library(tidyverse)

features <- read.csv("shiny/key/features.csv")

images <- read.csv("shiny/key/images.csv") %>%
  mutate(image = paste(as.character(image), image_type, sep = "."))

full_script <- c("library(shiny)
install.packages('munsell')
library(bslib)
library(DT)
library(knitr)
library(kableExtra)
library(tidyverse)

ui <- bslib::page_fluid(tags$h1('UK Phalacrotophora'),
                         tags$br(), # line break
                        layout_columns(card(tags$a('This multikey is designed to separate out the 4 species of Phalacrotophora (Diptera: Phoridae) known to occur in the UK, and includes species known to occur in Europe for comparison (TBA).'),
                                            tags$br(), # line break
                                            tags$a('Phalacrotophora are a cosmopolitan genus of flies, known for parasitising the pupal stage of ladybirds (Coleoptera: Coccinellidae).')
                                       ),
                   card(img(src='100.jpeg', width = 250)) ),
                  tags$a('Toggle between the tabs below and answer the questions to identify your specimen. You can answer the questions in any order. The two boxes at the bottom of the page will show the closest matches to the features you selected. If there are questions for which your closest match is incorrect, go back and review the features for those questions.'),
                 tags$br(), # line break
                 tags$a('Male specimens of P. delageae and P. berolinensis cannot be reliably separated - record these as an aggregate unless a female is also collected. P. harveyi has only been collected as a female, therefore they cannot yet be identified using male genitalia.'),
                 tags$br(), # line break
                 tags$br(), # line break
                 navset_card_underline(")

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
  
