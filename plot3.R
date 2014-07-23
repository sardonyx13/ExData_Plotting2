
NEI<- readRDS("summarySCC_PM25.rds")

png("plot3.png", width = 480, height = 480)

baltimore <- subset(NEI, fips == "24510", select = c(Emissions, year, type))

te <- tapply(baltimore$Emissions, baltimore$year, sum, na.rm = TRUE)
barplot(te, ylab = "Total Emissions in tons", main = "Total Emissions per Year in Baltimore")
abline(h = te["2008"], lty = 2)

dev.off()