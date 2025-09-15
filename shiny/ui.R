ui <- fluidPage(titlePanel('UK Phalacrotophora', windowTitle = 'Example Window Title'),
                mainPanel(htmlOutput('description')),
                sidebarPanel(htmlOutput('suggestions')),
                tabsetPanel(
tabPanel('Legs',
                           sidebarPanel(
radioButtons('hind_metatarsus_shape', 'Does the hind metatarsus appear swollen?', choices = c(
'Yes - somewhat', 
'No - at most slightly swollen'), selected = character(0)),
radioButtons('hind_metatarsus_colour', 'What colour is the hind metatarsus?', choices = c(
'Dark brown to black', 
'Yellow to yellow-brown'), selected = character(0))),
mainPanel(
))
,
tabPanel('Males',
                           sidebarPanel(
radioButtons('right_hypandrium', 'Are the two lobes of the hypandrium even in length?', choices = c(
'Yes (97)', 
'No - the right lobe extends to the tip or beyond the end of the epandrium (98).'), selected = character(0))),
mainPanel(
img(src='97.jpeg'),
img(src='98.jpeg')))
,
tabPanel('Females',
                           sidebarPanel(
radioButtons('ovipositor_hook', 'Is there a pair of dark, thorn-like points near the end of the ovipositor?', choices = c(
'No (100)', 
'Yes (99)'), selected = character(0)),
radioButtons('ovipositor_hair', 'Are the long hairs ventrally (on the underside) of abdominal segment 8?', choices = c(
'No - short hairs only (100)', 
'Yes (99)'), selected = character(0))),
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
