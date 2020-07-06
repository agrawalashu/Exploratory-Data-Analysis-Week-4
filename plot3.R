NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Subset Baltimore data
baltiNEI <- subset(NEI, fips == "24510")

## Aggregate total emissions for each year by type
baltiPerYearByType <- aggregate(Emissions ~ year + type, baltiNEI, sum)


install.packages(ggplot2)
library(ggplot2)
## Plot as lines, group and color by type
png(filename = "plot3.png", width = 500, height = 500)
ggplot(baltiPerYearByType, aes(x=year, y=Emissions, group=type, colour=type)) +
        geom_point() + geom_line() +
        xlab("Year") + ylab("Total Emissions")
#Close device driver
dev.off()
