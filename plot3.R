
library(plyr)
library(ggplot2)

NEI<- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510", select = c(Emissions, year, type))

# aggrigate emissions per type, per year
data <- ddply(baltimore, .(year, type), summarize, Emissions = sum(Emissions))
data$Emissions <- round(data$Emissions, digits = 2)

png("plot3.png", width = 480, height = 480)

g <- ggplot(data, aes(y = Emissions, x = factor(year))) + 
     geom_bar(stat = "identity",  fill="darkblue") + 
     facet_wrap(~ type) +
     geom_text(aes(y = Emissions, ymax = Emissions, label = Emissions), 
               position = position_dodge(width=0.9), vjust = -.5, size = 3) +
     scale_x_discrete("Year")
print(g)

dev.off()
