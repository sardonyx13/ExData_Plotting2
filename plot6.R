NEI<- readRDS("summarySCC_PM25.rds")

png("plot6.png", width = 680, height = 680)

baltimore <- subset(NEI, fips == "24510", select = c(Emissions, year, type))
la <- subset(NEI, fips == "06037", select = c(Emissions, year, type))


# assume that 'motor vehicle' completely correspond 'ON-ROAD' type
#
baltimore <- subset(baltimore, type == "ON-ROAD", select = c(Emissions, year))
la <- subset(la, type == "ON-ROAD", select = c(Emissions, year))

tebl <- tapply(baltimore$Emissions, baltimore$year, sum, na.rm = TRUE)
tela <- tapply(la$Emissions, la$year, sum, na.rm = TRUE)

par(mfcol = c(2,2))

barplot(rbind(tela, tebl),
        col = c("grey", "white"),
        main = "Total emissions from motor vehicle per year", 
        ylab = "Emissions from motor vehicle in tons",
        legend = c("Los Angeles County", "Baltimore City"),
        args.legend = list(x = "bottomright"))

barplot(rbind(diff(tela), diff(tebl)), beside = TRUE,
        col = c("grey", "white"),
        main = "Changes in emissions between years", 
        ylab = "Changes in tons",
        names = c("1999-2002", "2002-2005", "2005-2008"),
        legend = c("Los Angeles County", "Baltimore City"),
        args.legend = list(x = "topright"))


barplot(rbind(diff(tela)/tela[1:3] * 100, diff(tebl)/tebl[1:3] *100), 
        beside = TRUE,
        col = c("grey", "white"),
        main = "Changes in emissions between years", 
        ylab = "Changes in percent",
        names = c("1999-2002", "2002-2005", "2005-2008"),
        legend = c("Los Angeles County", "Baltimore City"),
        args.legend = list(x = "bottomright"))


dev.off()