#### Exploratory Data Analysis (EDA) - Module 4 - Project 2 ###
#### Data Science Program - John Hopkins University & Cousera ###


####  PM2.5 Emissions Data ###

install.packages("data.table")
library(data.table)

### Uploading the data ----

### setting the working directory ###

setwd("~/Coursera/2025/Modulo 4/week 4 - module 4/Exploratory-Data-Analysis-Project-2/exdata_data_NEI_data")
dev.new(noRStudioGD = TRUE)

getwd()

#### uploading the data ----

SCC <- data.table::as.data.table(x = readRDS(file = "Source_Classification_Code.rds"))
NEI <- data.table::as.data.table(x = readRDS(file = "summarySCC_PM25.rds"))


#### Question 1 ----

NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]

totalNEI <- NEI[, lapply(.SD, sum, na.rm = TRUE), .SDcols = c("Emissions"), by = year]

png(filename='plot1.png')

barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years")

dev.off()



#### Question 2 ----


NEI[, Emissions := lapply(.SD, as.numeric), .SDcols = c("Emissions")]
totalNEI <- NEI[fips=='24510', lapply(.SD, sum, na.rm = TRUE)
                , .SDcols = c("Emissions")
                , by = year]

png(filename='plot2.png')

barplot(totalNEI[, Emissions]
        , names = totalNEI[, year]
        , xlab = "Years", ylab = "Emissions"
        , main = "Emissions over the Years - Baltimore City, Maryland")

dev.off()



#### Question 3 ----


















