##Down file

download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "exdata_data_NEI_data.zip", quiet = T)

# Unzip file:
unzip(zipfile = "exdata_data_NEI_data.zip")

# Delete .zip file:
file.remove("exdata_data_NEI_data.zip")

# Read data:
SCC <- readRDS(file = "Source_Classification_Code.rds")
NEI <- readRDS(file = "summarySCC_PM25.rds")

## Total emissions for each year 1999-2008
totaleveryYear <- aggregate(Emissions ~ year, NEI, sum)

##Load into png file
png(filename = "plot1.png", width = 500 , height = 500)
plot(totaleveryYear, type = "l", col = "darkblue",
     xlab = "Year", ylab = "Total emissions of PM2.5 (tons)",
     main = "Total Emissions of PM2.5 in Baltimore City (1999 - 2008)")
##Close Driver connection
dev.off()
