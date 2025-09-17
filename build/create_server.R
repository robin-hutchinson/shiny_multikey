library(tidyverse)

features <- read.csv("shiny/key/features.csv")

qs <- unique(features$body_part)

full_script <- c("
library(shiny)
install.packages('munsell')
library(hms)
library(bslib)
library(DT)
library(knitr)
library(kableExtra)
library(tidyverse)

server <- function(input, output) {

  features <- read.csv('key/features.csv')
  
  question_results <- reactive({
    
    genera <- features %>%
      distinct(taxa)
    
    total <- data.frame('taxa',
                        'matched_features',
                        'unmatched_features')%>%
      filter(row_number() != 1)
    colnames(total) <- c('taxa',
                         'matched_features',
                         'unmatched_features')
    g <- features
    
                 ")
for(i in 1:length(qs)) {
  
  q <- qs[i]
    
    q_script <- paste(
    "if(!is.null(input$",q, ")) {
      
      passed <- g %>%
        filter(body_part == '",q, "' & answer == input$",q, ")%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == '",q, "' ,
               answer != input$",q, ",
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } ",
    sep = '')
    
    
  full_script <- c(full_script, q_script)
  
}

full_script <- c(full_script, 
                 "total_matched_features <- total %>%
      filter(!is.na(matched_features))%>%
      distinct(taxa, matched_features) %>%
      count(taxa) %>%
      rename(total_features_matched = n) 
    genera <- full_join(genera, total_matched_features, by = 'taxa') 
    
    if(length(unique(total$matched_features)) > 1) {
      matched_feature_list <- total %>%
        filter(!is.na(matched_features))%>%
        distinct(taxa, matched_features) %>%
        group_by(taxa)%>%
        arrange(matched_features) %>%
        mutate(row = paste('n', as.character(row_number()), sep = '')) %>%
        pivot_wider(names_from = row, values_from = matched_features)  %>%
        unite(matched_features, -taxa, sep = '<br/>', na.rm = TRUE) %>%
        distinct(taxa, matched_features)
      
      genera <- full_join(genera, matched_feature_list, by = 'taxa') 
      
    }
    
    if(length(unique(total$unmatched_features)) > 1) {
      unmatched_feature_list <- total %>%
        filter(!is.na(unmatched_features))%>%
        distinct(taxa, unmatched_features) %>%
        group_by(taxa)%>%
        arrange(unmatched_features) %>%
        mutate(row = paste('n', as.character(row_number()), sep = '')) %>%
        pivot_wider(names_from = row, values_from = unmatched_features) %>%
        unite(unmatched_features, -taxa, sep = '<br/>', na.rm = TRUE) %>%
        distinct(taxa, unmatched_features)
      
      genera <- full_join(genera, unmatched_feature_list, by = 'taxa') 
      
    }
    
    unanswered_question_list <- features %>%
      filter(!(question %in% c(unique(total$matched_features), unique(total$unmatched_features))))%>%
      rename(unanswered_question = question) %>%
      distinct(taxa, unanswered_question) %>%
      group_by(taxa)%>%
      arrange(unanswered_question) %>%
      mutate(row = paste('n', as.character(row_number()), sep = '')) %>%
      pivot_wider(names_from = row, values_from = unanswered_question) %>%
      unite(unanswered_question, -taxa, sep = '<br/>', na.rm = TRUE) 
    genera <- full_join(genera, unanswered_question_list, by = 'taxa') 
    if(length(unique(total$matched_features)) <= 1) {
      
      genera <- genera %>%
        mutate(matched_features = '',
               unmatched_features = '')
    }
    genera
  })
  

  results <- reactive(
                 {available_features <- question_results() %>%
      mutate(matched_features_count = str_count(matched_features, '<br/>'),
             unmatched_features_count = str_count(unmatched_features, '<br/>'))%>%
      mutate(matched_features_count = replace_na(matched_features_count, 0),
             unmatched_features_count = replace_na(unmatched_features_count, 0)) %>%
      mutate(matched_features_count = case_when(matched_features_count == 0 & nchar(matched_features) > 2 ~ 1,
                                                TRUE ~ matched_features_count),
             unmatched_features_count = case_when(unmatched_features_count == 0 & nchar(unmatched_features) > 2 ~ 1,
                                                 TRUE ~ unmatched_features_count)) %>%
      arrange(desc(matched_features_count), unmatched_features_count) %>%
      ungroup() %>%
      mutate(matched_features = replace_na(matched_features, ''),
             unmatched_features = replace_na(unmatched_features, ''))}
  )
  
  output$results1 <- renderUI({
    
    results1 <- results() %>%
      filter(row_number() == 1)
    
    HTML(paste('<b>The  closest match is <b><i>',
               results1$taxa,
               '</i>.</b>',
               'This taxa matched on the following questions:',
               results1$matched_features,
               '<br/>',
               '<b>It did not match on the questions below:</b>',
               results1$unmatched_features,
               sep = ''
               
               
               
    ))
    }
    
    )
  
  output$results2 <- renderUI({
    
    results2 <- results() %>%
      filter(row_number() == 2)
    
    HTML(paste('<b>The second closest match is <b><i>',
               results2$taxa,
               '</i>.</b>',
               'This taxa matched on the following questions:',
               results2$matched_features,
               '<br/>',
               '<b>It did not match on the questions below:</b>',
               results2$unmatched_features,
               sep = ''
               
               
               
    ))
  }
  
  )
  
}
")

write_lines(full_script, 'shiny/server.R')
