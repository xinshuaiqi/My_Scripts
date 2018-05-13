require(maps)
library(mapproj)

worldmap <- map('world', plot = FALSE, fill = FALSE,  projection = "azequalarea")
country = worldmap$names
set.seed(1234)
var.2010 = rnorm (length (country), 20, 10)
var.2011 = var.2010*1.1 + rnorm (length (country), 0, 1)
var.2012 = var.2011*0.98 + rnorm (length (country), 0, 4)
var.2013 = var.2011*0.98 + rnorm (length (country), 0, 30)
worldt <- data.frame (country, var.2010, var.2011, var.2012, var.2013)

mapplot(country ~ var.2013, worldt, map = map("world",     plot = FALSE, fill = TRUE))