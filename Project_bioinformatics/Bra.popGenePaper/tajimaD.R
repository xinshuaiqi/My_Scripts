setwd("/Users/hongan/Desktop/B_napus_results/tajimaD")

all<-read.table("TajimaD_all.Tajima.D",header=TRUE)
summary(all)
all[,4]
# remove all the tajimaD value=0
all_b=all[,4][!all[,4] %in% '0'] 
all_b
summary(all_b)
boxplot(all_b)

#how many percent of the loci were under estimation
percent=length(all_b)/length(all[,4])*100
percent

?hist
#hist(t[,4],col="grey",breaks = 50,border="grey",xlim=range(-1,5),ylim=range(0,1000))
par(mfrow=c(1,3))
hist(all_b,col=rgb(0,0,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))

green<-read.table("TajimaD_green.Tajima.D",header=TRUE)
spring<-read.table("TajimaD_spring.Tajima.D",header=TRUE)
winter<-read.table("TajimaD_winter.Tajima.D",header=TRUE)
eu<-read.table("TajimaD_EU.Tajima.D",header=TRUE)
ea<-read.table("TajimaD_EA.Tajima.D",header=TRUE)
swede<-read.table("TajimaD_swede.Tajima.D",header=TRUE)

green_b=green[,4][!green[,4] %in% '0']
spring_b=spring[,4][!spring[,4] %in% '0']
winter_b=winter[,4][!winter[,4] %in% '0']
eu_b=eu[,4][!eu[,4] %in% '0']
ea_b=ea[,4][!ea[,4] %in% '0']
swede_b=swede[,4][!swede[,4] %in% '0']

#run grey graph, run par(new=TRUE), run green graph; run grey graph again for next cycle
par(new=TRUE)
hist(green_b,col=rgb(0,1,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))
hist(spring_b,col=rgb(0,1,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))
hist(winter_b,col=rgb(0,1,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))
hist(winter_b,col=rgb(0,0,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))
hist(eu_b,col=rgb(0,1,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))
hist(ea_b,col=rgb(0,1,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))
hist(swede_b,col=rgb(0,1,0,0.5),breaks = 50,border="grey",xlim=range(-2,4),ylim=range(0,200000))

summary(winter_b)
summary(green_b)
summary(spring_b)
summary(eu_b)
summary(swede_b)
summary(ea_b)

