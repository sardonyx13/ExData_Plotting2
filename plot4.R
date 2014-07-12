
NEI<- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot4.png", width = 480, height = 480)

# identifies sources related to coal combustion
#
# goes through categories and select who has 'coal' in description
pattern <- "Coal|coal"
coal <- grepl(pattern, SCC$EI.Sector) |
        grepl(pattern, SCC$SCC.Level.One) |
        grepl(pattern, SCC$SCC.Level.Two) |
        grepl(pattern, SCC$SCC.Level.Three) |
        grepl(pattern, SCC$SCC.Level.Four)

# extract corresponding ids
coal <- SCC$SCC[coal]

# extract measurments which corresponding to coal combustion
te <- subset(NEI, SCC %in% coal, select = c(Emissions, year))

# calculate total per years
te <- tapply(te$Emissions, te$year, sum, na.rm = TRUE)
barplot(te/1000, ylab = "Emissions from coal combustion in killo-tons", main = "Emissions from coal combustion across Unated States per Year")
abline(h = te["2008"]/1000, lty = 2)

dev.off()