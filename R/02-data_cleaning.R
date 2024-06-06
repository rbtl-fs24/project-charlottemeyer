library(tidyverse)
library(dplyr)
library(readr)

waste_disposal_behavior <- read_csv("data/raw/influence_environment_behavior_waste_disposal_raw.csv")

glimpse(waste_disposal_behavior)

waste_disposal_behavior_date_ID <- waste_disposal_behavior |> 
  mutate(Timestamp = as_date(Timestamp)) |> 
  mutate(id = seq(1,length(Timestamp))) |> 
  relocate(id) 

colnames(waste_disposal_behavior_date_ID)

variable_names <- c("id", "date", "age_range", "native_language", "current_degree",
               "recycling_habits_start", "waste_reduction_action",
               "lunch_recycling_yesno", "lunch_recycled_items",
               "hike_recycling_location", "hike_recycle_chipsBag", "hike_recycle_chipsBag_why",
               "limmat_recycling_location", "limmat_friends_behavior_reaction",
               "limmat_recycle_plasticBottle", "limmat_recycle_plasticBottle_why",
               "recycling_habits_end", "recycling_habits_improvements",
               "lunch_recycling_littleTime", "feedback")

colnames(waste_disposal_behavior_date_ID) <- variable_names

waste_disposal_behavior_date_ID_correctedOrder <- waste_disposal_behavior_date_ID |> 
  relocate(lunch_recycling_littleTime, .before = hike_recycling_location)

##make the multiple choices in one additional column for each choice by counting
##the number of "," in the initial column or with the "case_when" function

waste_disposal_behavior_clean <- waste_disposal_behavior_date_ID_correctedOrder

write_csv(waste_disposal_behavior_clean, "data/processed/influence_environment_behavior_waste_disposal_processed.csv")
