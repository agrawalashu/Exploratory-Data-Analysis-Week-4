##Down file

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "exdata_data_NEI_data.zip", quiet = T)

# Unzip file:
unzip(zipfile = "exdata_data_NEI_data.zip")

# Delete .zip file:
file.remove("exdata_data_NEI_data.zip")

# Read data:
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

## Get Baltimore data
baltiNEI <- subset(NEI, fips == "24510")

## Total emissions for each year
baltimoreeveryrYear <- aggregate(Emissions ~ year, baltiNEI, sum)

## Plot the line to see if emissions have decreased
png(filename = "plot2.png", width = 500, height = 500)
plot(baltimoreeveryrYear, type = "l", col = "red",
     xlab = "Year", ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 in Baltimore City (1999 - 2008)")
##Close Driver connection
dev.off()
