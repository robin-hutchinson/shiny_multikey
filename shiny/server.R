library(shiny)
library(DT)
library(knitr)
library(kableExtra)
library(tidyverse)

server <- function(input, output) {
  
  question_results <- reactive({
    
    features <- read.csv("key/features.csv")
    
    genera <- features %>%
      distinct(genus)
    
    total <- data.frame("genus",
                        "matched_features",
                        "unmatched_features")%>%
      filter(row_number() != 1)
    colnames(total) <- c("genus",
                         "matched_features",
                         "unmatched_features")
    g <- features
    
    if(!is.null(input$vein_3_fork)) {
      
      passed <- g %>%
        filter(body_part == "vein_3_fork"& answer == input$vein_3_fork)%>%
        rename(matched_features = question) %>%
        distinct(genus, matched_features)
      failed <- g %>%
        filter(body_part == "vein_3_fork",
               answer != input$vein_3_fork,
               !(genus %in% passed$genus)) %>%
        rename(unmatched_features = question) %>%
        distinct(genus, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ""))
      total <- full_join(total, new_total,  by = c("genus",
                                                   "matched_features",
                                                   "unmatched_features"))
    } 
    
    
    total_matched_features <- total %>%
      filter(!is.na(matched_features))%>%
      distinct(genus, matched_features) %>%
      count(genus) %>%
      rename(total_features_matched = n) 
    genera <- full_join(genera, total_matched_features, by = "genus") 
    
    if(length(unique(total$matched_features)) > 1) {
      matched_feature_list <- total %>%
        filter(!is.na(matched_features))%>%
        distinct(genus, matched_features) %>%
        group_by(genus)%>%
        arrange(matched_features) %>%
        mutate(row = paste("n", as.character(row_number()), sep = "")) %>%
        pivot_wider(names_from = row, values_from = matched_features)  %>%
        unite(matched_features, -genus, sep = "<br/>", na.rm = TRUE) %>%
        distinct(genus, matched_features)
      
      genera <- full_join(genera, matched_feature_list, by = "genus") 
      
    }
    
    if(length(unique(total$unmatched_features)) > 1) {
      unmatched_feature_list <- total %>%
        filter(!is.na(unmatched_features))%>%
        distinct(genus, unmatched_features) %>%
        group_by(genus)%>%
        arrange(unmatched_features) %>%
        mutate(row = paste("n", as.character(row_number()), sep = "")) %>%
        pivot_wider(names_from = row, values_from = unmatched_features) %>%
        unite(unmatched_features, -genus, sep = "<br/>", na.rm = TRUE) %>%
        distinct(genus, unmatched_features)
      
      genera <- full_join(genera, unmatched_feature_list, by = "genus") 
      
    }
    
    unanswered_question_list <- features %>%
      filter(!(question %in% c(unique(total$matched_features), unique(total$unmatched_features))))%>%
      rename(unanswered_question = question) %>%
      distinct(genus, unanswered_question) %>%
      group_by(genus)%>%
      arrange(unanswered_question) %>%
      mutate(row = paste("n", as.character(row_number()), sep = "")) %>%
      pivot_wider(names_from = row, values_from = unanswered_question) %>%
      unite(unanswered_question, -genus, sep = "<br/>", na.rm = TRUE) 
    genera <- full_join(genera, unanswered_question_list, by = "genus") 
    if(length(unique(total$matched_features)) <= 1) {
      
      genera <- genera %>%
        mutate(matched_features = "",
               unmatched_features = "")
    }
    
  })
  
  suggestions <- reactive({
    
    possibles <- question_results() %>%
      filter(unmatched_features == "" |
               is.na(unmatched_features)) %>%
      distinct(genus)
    question_options <- features %>%
        filter(genus %in% possibles$genus) %>%
        distinct(question, answer) %>%
        count(question) %>%
        filter(n == 1)
 print(question_options$question)
    question_coverage <- features %>%
      filter(genus %in% possibles$genus)
    
    if(!is.null(question_options$question)) {
      
      question_coverage <- question_coverage %>%
        filter(!(question %in% question_options$question))
      
    }
    question_coverage <-  question_coverage  %>%
      distinct(genus, question) %>%
      count(question) %>%
      rename(genus_by_question = n)

    group_evenness <- features %>%
      filter(genus %in% possibles$genus) %>%
      distinct(genus, question, answer) %>%
      group_by(question) %>%
      count(answer) %>%
      mutate(split_evenness = sd(n)) %>%
      distinct(question, split_evenness) %>%
      left_join(question_coverage, by = "question") %>%
      arrange(desc(genus_by_question), split_evenness)

    best_3 <- group_evenness[c(1:3), "question" ]
 
    paste("The three questions that best separate the remaining taxa are:",group_evenness[1, "question" ], group_evenness[2, "question" ], group_evenness[3, "question" ], sep = "<br/><br/>")
    
  })
  output$results <- renderText(
    {available_features <- features %>%
      distinct(genus, body_part) %>%
      count(genus) %>%
      rename("Total features available" = n) %>%
      left_join(question_results(), by = "genus") %>%
      arrange(total_features_matched) %>%
      rename("Possible genera are" = genus)
    
    kable(available_features)}
  )
  
  output$suggestions <- renderUI( HTML(suggestions()) )
  
  output$description <- renderUI(HTML("This key is based on Henry Disney's Key to UK Phoridae. The three questions to the right suggest the best characteristics to separate the remaining species, however does not mean that you cannot answer other questions first if you prefer."))
}
