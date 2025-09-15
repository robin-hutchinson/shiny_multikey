library(shiny)
library(DT)
library(knitr)
library(kableExtra)
library(tidyverse)
features <- read.csv('key/features.csv')

server <- function(input, output) {
  
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
    
                 
if(!is.null(input$ocelli)) {
      
      passed <- g %>%
        filter(body_part == 'ocelli' & answer == input$ocelli)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'ocelli' ,
               answer != input$ocelli,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$head_shape)) {
      
      passed <- g %>%
        filter(body_part == 'head_shape' & answer == input$head_shape)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'head_shape' ,
               answer != input$head_shape,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$frons)) {
      
      passed <- g %>%
        filter(body_part == 'frons' & answer == input$frons)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'frons' ,
               answer != input$frons,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$thoracic_notum)) {
      
      passed <- g %>%
        filter(body_part == 'thoracic_notum' & answer == input$thoracic_notum)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'thoracic_notum' ,
               answer != input$thoracic_notum,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$tergite_5)) {
      
      passed <- g %>%
        filter(body_part == 'tergite_5' & answer == input$tergite_5)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'tergite_5' ,
               answer != input$tergite_5,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$vein_3_hairs)) {
      
      passed <- g %>%
        filter(body_part == 'vein_3_hairs' & answer == input$vein_3_hairs)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'vein_3_hairs' ,
               answer != input$vein_3_hairs,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$vein_3_fork)) {
      
      passed <- g %>%
        filter(body_part == 'vein_3_fork' & answer == input$vein_3_fork)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'vein_3_fork' ,
               answer != input$vein_3_fork,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$vein_6)) {
      
      passed <- g %>%
        filter(body_part == 'vein_6' & answer == input$vein_6)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'vein_6' ,
               answer != input$vein_6,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$costa)) {
      
      passed <- g %>%
        filter(body_part == 'costa' & answer == input$costa)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'costa' ,
               answer != input$costa,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$costal_cilia)) {
      
      passed <- g %>%
        filter(body_part == 'costal_cilia' & answer == input$costal_cilia)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'costal_cilia' ,
               answer != input$costal_cilia,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$wing_membrane)) {
      
      passed <- g %>%
        filter(body_part == 'wing_membrane' & answer == input$wing_membrane)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'wing_membrane' ,
               answer != input$wing_membrane,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$vein_3_end)) {
      
      passed <- g %>%
        filter(body_part == 'vein_3_end' & answer == input$vein_3_end)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'vein_3_end' ,
               answer != input$vein_3_end,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$vein_4)) {
      
      passed <- g %>%
        filter(body_part == 'vein_4' & answer == input$vein_4)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'vein_4' ,
               answer != input$vein_4,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$vein_sc)) {
      
      passed <- g %>%
        filter(body_part == 'vein_sc' & answer == input$vein_sc)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'vein_sc' ,
               answer != input$vein_sc,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$mesopleural_hair)) {
      
      passed <- g %>%
        filter(body_part == 'mesopleural_hair' & answer == input$mesopleural_hair)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'mesopleural_hair' ,
               answer != input$mesopleural_hair,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$mesopleural_furrow)) {
      
      passed <- g %>%
        filter(body_part == 'mesopleural_furrow' & answer == input$mesopleural_furrow)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'mesopleural_furrow' ,
               answer != input$mesopleural_furrow,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$hind_tibia_bristles)) {
      
      passed <- g %>%
        filter(body_part == 'hind_tibia_bristles' & answer == input$hind_tibia_bristles)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'hind_tibia_bristles' ,
               answer != input$hind_tibia_bristles,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$hind_tibia_hair)) {
      
      passed <- g %>%
        filter(body_part == 'hind_tibia_hair' & answer == input$hind_tibia_hair)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'hind_tibia_hair' ,
               answer != input$hind_tibia_hair,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$mid_tibia_dorsal_bristles)) {
      
      passed <- g %>%
        filter(body_part == 'mid_tibia_dorsal_bristles' & answer == input$mid_tibia_dorsal_bristles)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'mid_tibia_dorsal_bristles' ,
               answer != input$mid_tibia_dorsal_bristles,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$fore_metatarsus)) {
      
      passed <- g %>%
        filter(body_part == 'fore_metatarsus' & answer == input$fore_metatarsus)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'fore_metatarsus' ,
               answer != input$fore_metatarsus,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$mid_tibia_anterior_bristles)) {
      
      passed <- g %>%
        filter(body_part == 'mid_tibia_anterior_bristles' & answer == input$mid_tibia_anterior_bristles)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'mid_tibia_anterior_bristles' ,
               answer != input$mid_tibia_anterior_bristles,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$fore_tibia_bristles)) {
      
      passed <- g %>%
        filter(body_part == 'fore_tibia_bristles' & answer == input$fore_tibia_bristles)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'fore_tibia_bristles' ,
               answer != input$fore_tibia_bristles,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$fore_tarsi)) {
      
      passed <- g %>%
        filter(body_part == 'fore_tarsi' & answer == input$fore_tarsi)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'fore_tarsi' ,
               answer != input$fore_tarsi,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$frons_bristles)) {
      
      passed <- g %>%
        filter(body_part == 'frons_bristles' & answer == input$frons_bristles)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'frons_bristles' ,
               answer != input$frons_bristles,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$frons_furrow)) {
      
      passed <- g %>%
        filter(body_part == 'frons_furrow' & answer == input$frons_furrow)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'frons_furrow' ,
               answer != input$frons_furrow,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$antennae)) {
      
      passed <- g %>%
        filter(body_part == 'antennae' & answer == input$antennae)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'antennae' ,
               answer != input$antennae,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$arista)) {
      
      passed <- g %>%
        filter(body_part == 'arista' & answer == input$arista)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'arista' ,
               answer != input$arista,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$sternites)) {
      
      passed <- g %>%
        filter(body_part == 'sternites' & answer == input$sternites)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'sternites' ,
               answer != input$sternites,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$palp_bristle)) {
      
      passed <- g %>%
        filter(body_part == 'palp_bristle' & answer == input$palp_bristle)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'palp_bristle' ,
               answer != input$palp_bristle,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$segment_3)) {
      
      passed <- g %>%
        filter(body_part == 'segment_3' & answer == input$segment_3)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'segment_3' ,
               answer != input$segment_3,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$segment_5)) {
      
      passed <- g %>%
        filter(body_part == 'segment_5' & answer == input$segment_5)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'segment_5' ,
               answer != input$segment_5,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$segments_5_and_6)) {
      
      passed <- g %>%
        filter(body_part == 'segments_5_and_6' & answer == input$segments_5_and_6)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'segments_5_and_6' ,
               answer != input$segments_5_and_6,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$Female)) {
      
      passed <- g %>%
        filter(body_part == 'Female' & answer == input$Female)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'Female' ,
               answer != input$Female,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
if(!is.null(input$proctiger)) {
      
      passed <- g %>%
        filter(body_part == 'proctiger' & answer == input$proctiger)%>%
        rename(matched_features = question) %>%
        distinct(taxa, matched_features)
      failed <- g %>%
        filter(body_part == 'proctiger' ,
               answer != input$proctiger,
               !(taxa %in% passed$taxa)) %>%
        rename(unmatched_features = question) %>%
        distinct(taxa, unmatched_features)
      
      new_total <- bind_rows(passed, failed) %>%
        mutate(unanswered_question = case_when(1==2 ~ ''))
      total <- full_join(total, new_total,  by = c('taxa',
                                                   'matched_features',
                                                   'unmatched_features'))
    } 
total_matched_features <- total %>%
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
  
  suggestions <- reactive({
    
    possibles <- question_results() %>%
      filter(unmatched_features == '' |
               is.na(unmatched_features)) %>%
      distinct(taxa)

    question_options <- features %>%
        filter(taxa %in% possibles$taxa) %>%
        distinct(question, answer) %>%
        count(question) %>%
        filter(n == 1)

    question_coverage <- features %>%
      filter(taxa %in% possibles$taxa)
    
    if(!is.null(question_options$question)) {
      
      question_coverage <- question_coverage %>%
        filter(!(question %in% question_options$question))
      
    }
    question_coverage <-  question_coverage  %>%
      distinct(taxa, question) %>%
      count(question) %>%
      rename(taxa_by_question = n)

    group_evenness <- features %>%
      filter(taxa %in% possibles$taxa) %>%
      distinct(taxa, question, answer) %>%
      group_by(question) %>%
      count(answer) %>%
      mutate(split_evenness = sd(n)) %>%
      distinct(question, split_evenness) %>%
      left_join(question_coverage, by = 'question') %>%
      arrange(desc(taxa_by_question), split_evenness)

    best_3 <- group_evenness[c(1:3), 'question' ]
 
    paste('The three questions that best separate the remaining taxa are:',group_evenness[1, 'question' ], group_evenness[2, 'question' ], group_evenness[3, 'question' ], sep = '<br/><br/>')
    
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
    
    HTML(paste('The closest match to the selected features is ',
               results1$taxa,
               '.<br/><br/>',
               'This taxa matched on the following characteristics:<br/>',
               results1$matched_features,
               '<br/><br/>',
               'It did not match on the features below:<br/>',
               results1$unmatched_features,
               sep = ''
               
               
               
    ))
    }
    
    )
  
  output$results2 <- renderUI({
    
    results2 <- results() %>%
      filter(row_number() == 2)
    
    HTML(paste('The second closest match to the selected features is ',
               results2$taxa,
               '.<br/><br/>',
               'This taxa matched on the following characteristics:<br/>',
               results2$matched_features,
               '<br/><br/>',
               'It did not match on the features below:<br/>',
               results2$unmatched_features,
               sep = ''
               
               
               
    ))
  }
  
  )
  
  output$results3 <- renderUI({
    
    results3 <- results() %>%
      filter(row_number() == 3)
    
    HTML(paste('The third closest match to the selected features is ',
               results3$taxa,
               '.<br/><br/>',
               'This taxa matched on the following characteristics:<br/>',
               results3$matched_features,
               '<br/><br/>',
               'It did not match on the features below:<br/>',
               results3$unmatched_features,
               sep = ''
               
               
               
    ))
  }
  
  )
  
  output$suggestions <- renderUI( HTML(suggestions()) )
  
  output$description <- renderUI(HTML('This key is based on Henry Disneys Key to UK Phoridae. The three questions to the right suggest the best characteristics to separate the remaining species, however does not mean that you cannot answer other questions first if you prefer.'))
}

