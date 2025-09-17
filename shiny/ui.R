library(shiny)
install.packages('munsell')
library(bslib)
library(DT)
library(knitr)
library(kableExtra)
library(tidyverse)

ui <- bslib::page_fluid(tags$h1('
UK Phalacrotophora
'),
                 tags$br(), # line break
                 layout_columns(card(
tags$a('This multikey is designed to separate out the 4 species of Phalacrotophora (Diptera: Phoridae) known to occur in the UK, and includes species known to occur in Europe for comparison (TBA).'),tags$br(),
tags$a('Phalacrotophora is a cosmopolitan genus of flies, known for parasitising the pupal stage of ladybirds (Coleoptera: Coccinellidae).')
),
                   card(
img(src='Phalacrotophora full image.jpg', width = 250))))
,
tags$a('Toggle between the tabs below and answer the questions to identify your specimen. You can answer the questions in any order. The two boxes at the bottom of the page will show the closest matches to the features you selected. If there are questions for which your closest match is incorrect, go back and review the features for those questions.'),tags$br(),tags$br(),
tags$a('Male specimens of P. delageae and P. berolinensis cannot be reliably separated - record these as an aggregate unless a female is also collected. P. harveyi has only been collected as a female, therefore they cannot yet be identified using male genitalia.'),tags$br(),tags$br(),
navset_card_underline(
nav_panel('Legs',
                           layout_columns(card(
radioButtons('hind_metatarsus_shape', 'Does the hind metatarsus appear swollen?', choices = c(
'Yes - somewhat', 
'No - at most slightly swollen'), selected = character(0)),
radioButtons('hind_metatarsus_colour', 'What colour is the hind metatarsus?', choices = c(
'Dark brown to black', 
'Yellow to yellow-brown'), selected = character(0)),
radioButtons('hind_femur_hair', 'Are the hairs on the basal half (nearest the body) of the hind femur long or short?', choices = c(
'Long (13, 14)', 
'Short (10)'), selected = character(0))),
card(
)))
,
nav_panel('Males',
                           layout_columns(card(
radioButtons('right_hypandrium', 'Are the two lobes of the hypandrium roughly the same length?', choices = c(
'Yes (97)', 
'No - the right lobe is clearly longer, extending to the tip or beyond the end of the epandrium (98).'), selected = character(0))),
card(
img(src='97.jpeg', width = 250),
img(src='98.jpeg', width = 250)),col_widths = c(4, 8)))
,
nav_panel('Females',
                           layout_columns(card(
radioButtons('ovipositor_hook', 'Is there a pair of dark, thorn-like points near the end of the ovipositor?', choices = c(
'No (100)', 
'Yes (99)'), selected = character(0)),
radioButtons('ovipositor_hair', 'How long are the hairs on the underside of abdominal segment 8?', choices = c(
'Short (100)', 
'Long (99)', 
'Intermediate'), selected = character(0))),
card(
img(src='100.jpeg', width = 250),
img(src='99.jpeg', width = 250)),col_widths = c(4, 8))))
,
layout_columns(card(htmlOutput('results1')), 
                                 card(htmlOutput('results2'))))
