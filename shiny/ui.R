ui <- fluidPage(titlePanel('Key to UK Phoridae Genera', windowTitle = 'UK Phoridae Key'),
                mainPanel(htmlOutput('description')),
                sidebarPanel(htmlOutput('suggestions')),
                tabsetPanel(
tabPanel('Wingless females',
                           sidebarPanel(
radioButtons('ocelli', 'Are the ocelli present?', choices = c(
'No', 
'Yes'), selected = character(0)),
radioButtons('head_shape', 'Is the head significantly shorter than it is broad?', choices = c(
'Yes (15)', 
'No (29)'), selected = character(0)),
radioButtons('frons', 'Are there bristle like hairs at the sides of the frons in front of the eyes?', choices = c(
'No', 
'Yes'), selected = character(0)),
radioButtons('thoracic_notum', 'Which description best fits the thoracis notum?', choices = c(
'Broader and longer than the head, with a convex anterior margin (15)', 
'As broad as the head but clearly shorter, with a somewhat concave anterior margin (29)'), selected = character(0)),
radioButtons('tergite_5', 'Is abdominal tergite 5 divided into two parts, with the anterior part being a semi-circular flap attached only along its straight, anterior edge?', choices = c(
'No', 
'Yes (128)'), selected = character(0))),
mainPanel(
img(src='15.jpeg'),
img(src='29.jpeg'),
img(src='128.jpeg')))
,
tabPanel('Wings',
                           sidebarPanel(
radioButtons('vein_3_hairs', 'Which of these best describes the hairs on vein 3', choices = c(
'Between 5 and 10 hairs on dorsal face, which may be quite fine (21, 22)', 
'Over 10 hairs on the dorsal face', 
'Single hair at base on the dorsal face', 
'Between 0 and 3 hairs restricted to basal quarter', 
'A bristle like hair at base and 1-4 finer hairs before the fork', 
'3 to 5 hairs extending from the base along the dorsal face'), selected = character(0)),
radioButtons('vein_3_fork', 'Is vein 3 forked?', choices = c(
'Yes (20, 69, 145 to 149, and 179)', 
'No (25 and 127)'), selected = character(0)),
radioButtons('vein_6', 'Is there a sudden bend in the middle of vein 6, opposite and opposed to the basal curve of vein 5?', choices = c(
'No', 
'Yes (76 to 78)'), selected = character(0)),
radioButtons('costa', 'Does the costa thicken somewhat distally?', choices = c(
'Yes (20)', 
'No (179)'), selected = character(0)),
radioButtons('costal_cilia', 'Are the costal cilia clearly longer than vein 2?', choices = c(
'Yes', 
'No'), selected = character(0)),
radioButtons('wing_membrane', 'What colour is the wing membrane?', choices = c(
'Conspicuously darkened', 
'Strongly greyish or brownish', 
'Slightly greyish'), selected = character(0)),
radioButtons('vein_3_end', 'Does vein 3 end in a small clear vesicle just beyond the point where it meets the costa?', choices = c(
'Yes (25)', 
'No (127)'), selected = character(0)),
radioButtons('vein_4', 'Is the base of vein 4 obliterated?', choices = c(
'Yes', 
'No'), selected = character(0)),
radioButtons('vein_sc', 'Does vein Sc end before meeting vein 1?', choices = c(
'Yes', 
'No'), selected = character(0))),
mainPanel(
img(src='8.jpeg'),
img(src='20.jpeg'),
img(src='21.jpeg'),
img(src='22.jpeg'),
img(src='25.jpeg'),
img(src='69.jpeg'),
img(src='76.jpeg'),
img(src='77.jpeg'),
img(src='78.jpeg'),
img(src='127.jpeg'),
img(src='145.jpeg'),
img(src='146.jpeg'),
img(src='147.jpeg'),
img(src='148.jpeg'),
img(src='149.jpeg'),
img(src='179.jpeg')))
,
tabPanel('Thorax',
                           sidebarPanel(
radioButtons('mesopleural_hair', 'Which option best describes the mesopleuron?', choices = c(
'Bare', 
'With hairs and a single long bristle near the posterior margin (9)', 
'With some hairs on the upper part', 
'With a patch of fine hairs near the dorsal edge'), selected = character(0)),
radioButtons('mesopleural_furrow', 'Is the mesopleural furrow present and centrally placed', choices = c(
'Yes (9)', 
'No (10)'), selected = character(0))),
mainPanel(
img(src='9.jpeg'),
img(src='10.jpeg'),
img(src='65.jpeg')))
,
tabPanel('Legs',
                           sidebarPanel(
radioButtons('hind_tibia_bristles', 'Which option best describes the bristles on the hind tibia?', choices = c(
'No isolated bristles other than the apical bristles (30)', 
'Isolated bristles (40 to 43)', 
'At least 2 true-dorsal bristles and one antero-dorsal bristle near the upper true-dorsal bristle (40 to 43)', 
'2 antero-dorsal bristles only, one situated near the end of the upper third and one near the middle', 
'A row of bristle like hairs on either side of the hair palisade', 
'A row of bristle like hairs behind the hair palisade'), selected = character(0)),
radioButtons('hind_tibia_hair', 'Which option best describes the hair on the dorsal face of the hind tibia?', choices = c(
'Simply haired (30)', 
'1 dorsal hair palisade (12)', 
'Transverse combs of stoutish hairs (75)', 
'2 to 3 dorsal hair palisades (12p)', 
'Transverse combs of of stoutish hairs (75)'), selected = character(0)),
radioButtons('mid_tibia_dorsal_bristles', 'How many true-dorsal bristles are on the mid tibia?', choices = c(
'0 or 1', 
'2 or more'), selected = character(0)),
radioButtons('fore_metatarsus', 'Is the fore metatarsus clearly longer than the fifth tarsal segment?', choices = c(
'Yes', 
'No'), selected = character(0)),
radioButtons('mid_tibia_anterior_bristles', 'Which option best describes the forward facing bristle on the mid tibia?', choices = c(
'Clearly longer than the width of the tibia at the point of insertion', 
'Shorter than the width of the tibia at the point of insertion'), selected = character(0)),
radioButtons('fore_tibia_bristles', 'Is there a bristle in upper two thirds that is shorter than maximum breadth of the tibia, with a row of short, robust, near dorsal spines just below this?', choices = c(
'Yes (11)', 
'No'), selected = character(0)),
radioButtons('fore_tarsi', 'Is there a clearly differentiated, short, dorsal, apical spur?', choices = c(
'Yes (11)', 
'No'), selected = character(0))),
mainPanel(
img(src='11.jpeg'),
img(src='12.jpeg'),
img(src='26.jpeg'),
img(src='30.jpeg'),
img(src='40.jpeg'),
img(src='41.jpeg'),
img(src='42.jpeg'),
img(src='43.jpeg'),
img(src='75.jpeg')))
,
tabPanel('Head',
                           sidebarPanel(
radioButtons('frons_bristles', 'Are there conspicuous bristles between the anterior ocellus and the base of the antennae?', choices = c(
'Yes (6)', 
'No'), selected = character(0)),
radioButtons('frons_furrow', 'Is there a median furrow extending outside the region of the supra-antennal bristles', choices = c(
'No (e.g. 6)', 
'Yes (124 to 126)'), selected = character(0)),
radioButtons('arista', 'Is the arista inserted apically or dorsally?', choices = c(
'Apically', 
'Dorsally (in a pre-apical position)'), selected = character(0)),
radioButtons('palp_bristle', 'Is the longest bristle on the palp more robust than upper occipital?', choices = c(
'Yes', 
'No'), selected = character(0))),
mainPanel(
img(src='6.jpeg'),
img(src='124.jpeg'),
img(src='125.jpeg'),
img(src='126.jpeg')))
,
tabPanel('Males',
                           sidebarPanel(
radioButtons('antennae', 'Is the third segment of the antennae drawn out into an elongated neck?', choices = c(
'Yes', 
'No'), selected = character(0)),
radioButtons('proctiger', 'Does the proctiger end in finely feathered bristles that are more robust than the hairs on the cerci?', choices = c(
'No (weaker than 7)', 
'Yes (97, 98)'), selected = character(0))),
mainPanel(
img(src='7.jpeg'),
img(src='97.jpeg'),
img(src='98.jpeg')))
,
tabPanel('Females',
                           sidebarPanel(
radioButtons('sternites', 'Does segment 6 have a distinct sternite?', choices = c(
'No', 
'Yes'), selected = character(0)),
radioButtons('segment_3', 'Which description best fits the papillae on segment 3?', choices = c(
'Present but do not fit the description above', 
'Small, oval-to-round papillae on each side towards the front margin'), selected = character(0)),
radioButtons('segment_5', 'Does segment 5 have a complex gland opening?', choices = c(
'No', 
'Yes'), selected = character(0)),
radioButtons('segments_5_and_6', 'Are there tergites on segments 5 and 6?', choices = c(
'Yes', 
'No'), selected = character(0)),
radioButtons('Female', 'Does the ovipositor curve downwards to a point?', choices = c(
'Yes', 
'No'), selected = character(0))),
mainPanel(
))
,
                  tabPanel('Results table', 
                           sidebarPanel(htmlOutput('results1')), 
                           sidebarPanel(htmlOutput('results2')), 
                           sidebarPanel(htmlOutput('results3'))
                  )
                ))
