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
tags$a('This multikey is designed to separate out the 4 species of Phalacrotophora (Diptera: Phoridae) known to occur in the UK, and includes species known to occur in Europe for comparison.'),
tags$a('Phalacrotophora is a cosmopolitan genus of flies, known for parasitising the pupal stage of ladybirds (Coleoptera: Coccinellidae).'),
tags$a('Flies in this genus share the following morphological characters:')
,
                 tags$ul(
tags$li('On the head, the palp bristles are about the size of the upper occipitals (they are not clearly more robust).'),
tags$li('On the wings, vein 3 is forked at the tip, and veins 5 and 6 do not bend towards each other.'),
tags$li('There are fewer than 10 hairs on the dorsal face of vein 3.'),
tags$li('The tibiae do not have any isolated bristles, except apically.'),
tags$li('The hind tibia has a single dorsal palisade, with a row of bristle-like hairs on each side.'),
tags$li('The mesopleural furrow is present.'),
tags$li('In males, the hairs on the proctiger are more robust than the hairs on the cerci.'),
tags$li('Females only have tergites on abdominal segments 1 to 4 and a small papilla on each side of abdominal tergite 3 near the margin.')
)),
card(
layout_column_wrap(width = 1/3,img(src='Phalacrotophora full image.jpg'))
)),
tags$a('Toggle between the tabs below and answer the questions to identify your specimen. You can answer the questions in any order. The two boxes at the bottom of the page will show the closest matches to the features you selected. If there are questions for which your closest match is incorrect, go back and review the features for those questions. '),tags$br(),tags$br(),
tags$a('Ladybird pupa species is included as Phalacrotophora do have a host preference, however they can parasitise other ladybird species and so this question should not be used in isolation.'),tags$br(),tags$br(),
tags$a('Male specimens of P. delageae and P. berolinensis cannot be reliably separated - record these as an aggregate unless a female is also collected. P. harveyi has only been collected as a female, therefore they cannot yet be identified using male genitalia.'),tags$br(),tags$br(),
navset_card_underline(
nav_panel('Females',
                           layout_columns(card(
radioButtons('ovipositor_hair', 'How long are the hairs on the underside of abdominal segment 8?', choices = c(
'Short (100)', 
'Long (99)', 
'Intermediate'), selected = character(0)),
radioButtons('ovipositor_hook', 'Is there a pair of dark, thorn-like points near the end of the ovipositor?', choices = c(
'No (100)', 
'Yes (99)'), selected = character(0)),
radioButtons('tergite_colour', 'What colour are tergites 1 to 3?', choices = c(
'Brown', 
'Dark', 
'Largely orange'), selected = character(0))),
card(
layout_column_wrap(width = 1/3,img(src='100.jpeg'),
img(src='99.jpeg'))
), col_widths = c(4,8))),
nav_panel('Head',
                           layout_columns(card(
radioButtons('frons_colour', 'What colour is the frons?', choices = c(
'Shiny brownish, getting darker to the dorsal margin.', 
'Shiny yellow, with dark patches around the ocelli.', 
'Brown but with a pale median band bordering the median furrow.', 
'Brown, but paler (almost orange) ventrally.', 
'The upper half is brown, orange from the level of the antero-bristles forwards.'), selected = character(0)),
radioButtons('supraantennal_setae', 'How many supra-antennal setae are there?', choices = c(
'4 - there are two weaker setae under the two strong setae.', 
'2 (1 pair)'), selected = character(0))),
card(
), col_widths = c(4,8))),
nav_panel('Ladybird',
                           layout_columns(card(
radioButtons('pupa', 'Which species of ladybird did the larvae emerge from?', choices = c(
'7-spot, Coccinella septempunctata', 
'2-spot or 10-spot, Adalia spp.', 
'Eyed, Anatis ocellata'), selected = character(0))),
card(
), col_widths = c(4,8))),
nav_panel('Legs',
                           layout_columns(card(
radioButtons('fore_metatarsus length', 'How long is the fore metatarsus?', choices = c(
'1.5 times as long as the second tarsal segment.', 
'About as long as the next 3 tarsal segments combined.'), selected = character(0)),
radioButtons('hind_femur_hair', 'Are the hairs on the basal half (nearest the body) of the hind femur long or short?', choices = c(
'Long (13, 14)', 
'Short (10)'), selected = character(0)),
radioButtons('hind_metatarsus_colour', 'What colour is the hind metatarsus?', choices = c(
'Dark brown to black', 
'Yellow to yellow-brown'), selected = character(0)),
radioButtons('hind_metatarsus_shape', 'Does the hind metatarsus appear swollen?', choices = c(
'Yes - somewhat', 
'No - at most slightly swollen'), selected = character(0))),
card(
), col_widths = c(4,8))),
nav_panel('Males',
                           layout_columns(card(
radioButtons('hypandrium_microtrichia', 'How much of the left lobe of the hypandrium is covered in microsetae?', choices = c(
'Just apically (at the tip), in a distinct patch.', 
'In the side view, the top half is covered along the entire length, but the bottom half is only covered apically.', 
'The side view is entirely covered in microsetae.'), selected = character(0)),
radioButtons('right_hypandrium', 'Are the two lobes of the hypandrium roughly the same length?', choices = c(
'Yes (97)', 
'No - the right lobe is clearly longer, extending to the tip or beyond the end of the epandrium (98).'), selected = character(0))),
card(
layout_column_wrap(width = 1/3,img(src='97.jpeg'),
img(src='98.jpeg'))
), col_widths = c(4,8))),
nav_panel('Thorax (side view)',
                           layout_columns(card(
radioButtons('mesopleuron', 'Is there hair on the mesopleuron?', choices = c(
'No', 
'Yes'), selected = character(0))),
card(
), col_widths = c(4,8))),
nav_panel('Thorax (top view)',
                           layout_columns(card(
radioButtons('scutellum', 'Are the 4 setae on the scutellum almost equal?', choices = c(
'Yes', 
'No - the anterior pair (closest to the head) are almost hair like, while the posterior pair are much stronger.'), selected = character(0))),
card(
), col_widths = c(4,8))),
nav_panel(
tags$a('Disney, R.H.L. (1983) Handbook for the Identification of British Insects: Scuttle flies: Diptera, Phoridae (except Megaselia). Royal Entomological Society, 10(6)'),
tags$a('Disney, R.H.L. & Beuk, P. (1997). European Phalacrotophora (Diptera: Phoridae). Entomologist's Gazette. 48: 185-192. '),
tags$a('Disney, R.H.L. & Smith, D.A. (2016) A new species of Phalacrotophora Enderlein (Diptera: Phoridae) from England. Ent. Mon. Mag. 152(3): 189-192.'),
tags$a('Durska, E., Ceryngier, P. & Disney, R.H.L. (2003) Phalacrotophora beuki (Diptera: Phoridae), a parasitoid of ladybird pupae (Coleoptera: Coccinellidae). European Journal of Entomology. 100: 627-630.'),
tags$a('Irwin, A.G. and Harvey, M.C. (2014) Phalacrotophora delageae Disney (Diptera, Phoridae) new to Britain. Dipterists Digest, 21: 77-80.'),
tags$a('Lengyel, G.D. (2009) Phalacrotophora species (Diptera: Phoridae) with four subequal scutellar setae and notes on the other European species. Zootaxa, 2172 (1), 59–68.'),
tags$a('  ')
)),
layout_columns(card(htmlOutput('results1')), 
                                 card(htmlOutput('results2'))))
