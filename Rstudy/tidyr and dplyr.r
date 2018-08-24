# tidyr and dplyr、


install.packages("tidyr")  # install the package
library(tidyr)

install.packages("dplyr")  # install the package
library(dplyr) 
germination <- read.csv("Germination.csv", sep = ";") 
head(germination) 

# subset rows
germinSR <- filter(germination, Species == 'SR')

# select columns
germin_clean <- select(germination, Species, Treatment, Nb_seeds_germin)
# or 
germin_clean <- dplyr::select(germination, Species, Treatment, Nb_seeds_germin)

# create a new column
germin_percent <- mutate(germination, Percent = Nb_seeds_germin / Nb_seeds_tot * 100)
