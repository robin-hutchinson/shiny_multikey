ui <- fluidPage(titlePanel('Example Title', windowTitle = 'Example Window Title'),
                mainPanel(htmlOutput('description')),
                sidebarPanel(htmlOutput('suggestions')),
                tabsetPanel(
tabPanel('Legs',
                           sidebarPanel(
radioButtons('hind_metatarsus_shape', 'Does the hind metatarsus appear swollen?', choices = c(
'Yes - somewhat', 
'No - at most slightly swollen'), selected = character(0)),
radioButtons('hind_metatarsus_colour', 'What colour is the hind metatarsus', choices = c(
'Dark brown to black', 
'Yellow to yellow-brown'), selected = character(0))),
mainPanel(
))
,
tabPanel('Males',
                           sidebarPanel(
radioButtons('right_hypandrium', 'Are the two lobes of the hypandrium even in length?', choices = c(
'No - the right lobe extends to the tip or beyond the end of the epandrium (98).', 
'Yes (97)'), selected = character(0))),
mainPanel(
img(src='97.jpeg'),
img(src='98.jpeg')))
,
tabPanel('Females',
                           sidebarPanel(
radioButtons('ovipositor_end', 'Which statement best describes the end of the ovipositor?', choices = c(
'Simple in shape and with only short hairs (100).', 
'Long hairs ventrally (on the underside), and it has a pair of sub-terminal, dorsally projecting, thorn-like processes (99).'), selected = character(0))),
mainPanel(
img(src='100.jpeg'),
img(src='99.jpeg')))
,
                  tabPanel('Results table', 
                           sidebarPanel(htmlOutput('results1')), 
                           sidebarPanel(htmlOutput('results2')), 
                           sidebarPanel(htmlOutput('results3'))
                  )
                ))
