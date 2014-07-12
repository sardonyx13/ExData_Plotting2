NEI<- readRDS("summarySCC_PM25.rds")

#png("plot6.png", width = 480, height = 480)

baltimore <- subset(NEI, fips == "24510", select = c(Emissions, year, type))
la <- subset(NEI, fips == "06037", select = c(Emissions, year, type))


# assume that 'motor vehicle' completely correspond 'ON-ROAD' type
#
baltimore <- subset(baltimore, type == "ON-ROAD", select = c(Emissions, year))
la <- subset(la, type == "ON-ROAD", select = c(Emissions, year))

tebl <- tapply(baltimore$Emissions, baltimore$year, sum, na.rm = TRUE)
tela <- tapply(la$Emissions, la$year, sum, na.rm = TRUE)

barplot(tebl, ylab = "Emissions from motor vehicle in tons")
barplot(tela)


#dev.off()