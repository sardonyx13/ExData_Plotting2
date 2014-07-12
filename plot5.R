NEI<- readRDS("summarySCC_PM25.rds")

png("plot5.png", width = 480, height = 480)

baltimore <- subset(NEI, fips == "24510", select = c(Emissions, year, type))

# assume that 'motor vehicle' completely correspond 'ON-ROAD' type
baltimore <- subset(baltimore, type == "ON-ROAD", select = c(Emissions, year))

te <- tapply(baltimore$Emissions, baltimore$year, sum, na.rm = TRUE)
barplot(te, ylab = "Emissions from motor vehicle in tons", main = "Emissions from motor vehicle per Year in Baltimore")
abline(h = te["2008"], lty = 2)

dev.off()