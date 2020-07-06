NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset balti data
baltiNEI <- subset(NEI, fips == "24510")
## Subset coal combustion-related SCC classificators
vehSCC <- SCC[grepl("veh", SCC$EI.Sector, ignore.case = T), ]
## Subset balti NEI data where SCC in it matches SCC in vehSCC
baltivehNEI <- baltiNEI[baltiNEI$SCC %in% vehSCC$SCC, ]

## Aggregate total emissions for each year by type
baltivehEveryYear <- aggregate(Emissions ~ year, baltivehNEI, sum)

library(ggplot2)
## Plot as lines, group and color by type
png(filename = "plot5.png", width = 500, height = 500)
ggplot(baltivehEveryYear, aes(x=year, y=Emissions)) +  geom_point() + geom_line() +
        xlab("Year") + ylab("Emissions") + ggtitle("Vehicle Emissions in Baltimore")
dev.off()
#Close device driver



