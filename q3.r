#using wine data from the csv
winecsv <- file.choose()
wine <- read.csv(winecsv, header = TRUE, dec = ".")

str(wine)

wine2 <- wine
View(wine2)

lapply(wine2, mean, na.rm = TRUE)
lapply(wine2, sd, na.rm = TRUE)

#subtract mean and divide by std dev
scaledwine2 <-as.data.frame(scale(wine2))

#now the mean and the sd are 0 and 1 resp.
lapply(scaledwine2, mean, na.rm = TRUE)
lapply(scaledwine2, sd, na.rm = TRUE)

iris2 <- iris

#not using species column
iris2$Species <- NULL
View(iris2)

#mean and sd before normalization
lapply(iris2, mean, na.rm = TRUE)
lapply(iris2, sd, na.rm = TRUE)

#standarization
scalediris2 <- as.data.frame(scale(iris2))

#mena and sd after standarization
lapply(scalediris2, mean, na.rm = TRUE)
lapply(scalediris2, sd, na.rm = TRUE)

