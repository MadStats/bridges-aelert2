library(dplyr)
library(data.table)

# Need to open the zip file
dt <- fread("curl https://www.fhwa.dot.gov/bridge/nbi/2018hwybronefiledel.zip | funzip")

# Checking if it downloaded correctly
# View(dt)
head(dt) # Matches the first 6 rows of the Excel file
tail(dt) # Matches the last 6 rows of the Excel file
dim(dt) # Matches the number of rows and columns that I have when I open the file in Excel

# Finding the columns that I want to work with
colnames(dt)

# bridge ID, year, fips codes, condition ratings
dt_small <- select(dt, STRUCTURE_NUMBER_008, YEAR_BUILT_027, STATE_CODE_001, CAT10, CAT23, CAT29) %>% rename(bridge_id = STRUCTURE_NUMBER_008, year_built = YEAR_BUILT_027, fips_code = STATE_CODE_001, bridge_cond = CAT10, overall_bridge_cond = CAT23, deck_cond = CAT29)

# How many NAs in each column
?count