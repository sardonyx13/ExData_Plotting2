
NEI <- readRDS("summarySCC_PM25.rds")

png("plot1.png", width = 480, height = 480)

te <- tapply(NEI$Emissions, NEI$year, sum, na.rm = TRUE)
barplot(te/1000, ylab = "Total Emissions in killo-tons", main = "Total Emissions per Year")
abline(h = te["2008"]/1000, lty = 2)

dev.off()