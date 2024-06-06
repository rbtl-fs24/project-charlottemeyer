library(googlesheets4)
library(dplyr)
library(readr)

#download data from Google Sheet
capstone_data <- read_sheet("https://docs.google.com/spreadsheets/d/115cRald_SjuETYomhWa_qSWCFP49hXTWfdPLA4VM7Rs/edit#gid=1677548889")

#overview of the data
glimpse(capstone_data)

#write csv file with raw data
write_csv(capstone_data, "data/raw/influence_environment_behavior_waste_disposal_raw.csv")
