library(tidyverse)
library(readxl)
library(purrr)

sheets <- excel_sheets("genera/Key Features.xlsx")
feature_table <- data.frame()
for(i in 1:length(sheets)) {
  
  file <- read_excel("genera/Key Features.xlsx", sheet = sheets[i]) 
  columns <- colnames(file) 
  columns <- columns[!columns %in% c("genus")]
  file <- file %>%
    pivot_longer(cols = all_of(columns), names_to = "body_part", values_to = "meaning") %>%
    mutate(body_section = sheets[i],
           meaning = case_when(meaning == "N" & body_part == "ocelli_present" ~ "Absent",
                               meaning == "Y" & body_part == "ocelli_present" ~ "Present",
                               meaning == "N" & body_part == "vein_3_forked" ~ "Unforked (vein 2 is absent)",
                               meaning == "Y" & body_part == "vein_3_forked" ~ "Forked",
                               TRUE ~ meaning),
           body_part = case_when(body_part == "ocelli_present" ~ "ocelli",
                                 body_part == "vein_3_forked" ~ "vein_3",
                                 TRUE ~ body_part)) %>%
    select(genus, body_section, body_part, meaning)
    
  feature_table <- bind_rows(feature_table, file)
  rm(file)
  
}

feature_table <- feature_table %>%
  filter(!is.na(meaning)) %>%
  mutate(meaning = str_to_sentence(meaning),
         body_part = str_to_sentence(gsub("_", " ", body_part)),
         body_section = str_to_sentence(gsub("_", " ", body_section))) 
write.csv(feature_table, "genera/features.csv", row.names = FALSE)
rm(sheets, columns, i)