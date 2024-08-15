images <- read.csv("shiny/key/images.csv") %>%
  mutate(image = paste(as.character(image), image_type, sep = "."))

full_script <- c("ui <- fluidPage(titlePanel('Key to UK Phoridae Genera', windowTitle = 'UK Phoridae Key'),
                mainPanel(htmlOutput('description')),
                sidebarPanel(htmlOutput('suggestions')),
                tabsetPanel(")

sections <- unique(features$body_section)

for(i in 1:length(sections)){
  
  tab <- sections[i]
  full_script <- c(full_script,
                   paste("tabPanel('", tab, "',
                           sidebarPanel(", sep = ""))
  
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
  full_script <- c(full_script, "mainPanel(")
  tab_image <- images %>%
    filter(body_section == tab)
  if(nrow(tab_image) >= 1) {
  ims <- unique(tab_image$image)
  
  for(m in 1:length(ims)) {
    
    full_script <- c(full_script, 
                     paste("img(src='",
                           ims[m],
                           "'),", sep = ""))
    
  }
  
  full_script[length(full_script)] <- gsub(",$", "))", full_script[length(full_script)])
  
  
  } else {  full_script <- c(full_script, "))")}
  
  full_script <- c(full_script, ",")
  
}

full_script <- c(full_script,
                 "                  tabPanel('Results table', 
                           sidebarPanel(htmlOutput('results1')), 
                           sidebarPanel(htmlOutput('results2')), 
                           sidebarPanel(htmlOutput('results3'))
                  )
                ))")
  
write_lines(full_script, 'shiny/ui.R')  
  