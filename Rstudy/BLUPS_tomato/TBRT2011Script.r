## Set Working Directory for Mac
#setwd("/Users/heathermerk/Documents/TBRT2011")

## Set Working Director for PC
setwd("E:/GoogleDrive/My_Scripts/R学习/BLUPS_tomato")


## Read in Brix dataset
qualdat = read.csv("TBRTQuality.csv", header=T)

## Check to ensure data imported correctly
str(qualdat)
head(qualdat)
tail(qualdat)

## Attach dataset
attach(qualdat)

## Examine distribution of brix data
hist(Brix, col="gold")
boxplot(Brix~Loc, xlab="Location", ylab="Degrees Brix", main="Degrees Brix by Location", col="pink")

#qxs 
hist(pH);hist(TA)
boxplot(Brix ~ pH)

# Rename variables for ease of use
BRIX = as.numeric(Brix)
LINE = as.factor(Line)
LOC = as.factor(Loc)
YEAR = as.factor(Year)
REP = as.factor(Rep)

## Calculate variance components
# requires lme4 package
library(lme4)

# Linear Model with random effects for variance components
brixvarcomp = lmer(BRIX~ (1|LINE) + (1|LOC) + (1|YEAR) + (1|REP%in%LOC:YEAR) + (1|LINE:LOC) + (1|LINE:YEAR))
  #Error: grouping factors must have > 1 sampled level
brixvarcomp = lmer(Brix~ (1|Line) + (1|Loc) + (1|Year) + (1|(Rep:Loc):Year) + (1|Line:Loc) + (1|Line:Year))
brixvarcomp = lmer(BRIX~ (1|LINE) + (1|LOC) + (1|YEAR) + (1|REP%in%LOC:YEAR) + (1|LINE:LOC) + (1|LINE:YEAR),
                   control=lmerControl(check.nlev.gtr.1="ignore"))
  # %in% as nesting
  # : denotes interaction

# Extract variance components
summary(brixvarcomp)

## BLUPS
# fit the model
brixmodel = lmer(BRIX ~ (1|LINE) + (1|LOC) + (1|YEAR) + (1|REP%in%LOC:YEAR) + (1|LINE:LOC) + (1|LINE:YEAR))
brixmodel = lmer(BRIX~ (1|LINE) + (1|LOC) + (1|YEAR) + (1|REP%in%LOC:YEAR) + (1|LINE:LOC) + (1|LINE:YEAR),
     control=lmerControl(check.nlev.gtr.1="ignore"))

# estimate BLUPS for each line, then use blups for our selection
brixblup = ranef(brixmodel)

# look at output structure
str(brixblup)

# extract blup for each line (what we are interested in this case)
brixlineblup = brixblup$LINE

# see the structure of the blup for each line
str(brixlineblup)

# save the brixlineblup output to a separate .csv file
write.csv(brixlineblup, file="BrixLineBLUPS.csv")

## Creating plots with the BLUPs
# Create a numeric vector with the BLUP for each line
LINEBLUP = brixlineblup[,1]

# Create a histogram with the BLUP for each line
hist(LINEBLUP, col="brown")

## Compare BLUP to line averages on a scatterplot
lmean = tapply(BRIX, LINE, na.rm=T, mean)
plot(LINEBLUP, lmean, col="blue")






