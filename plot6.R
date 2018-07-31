library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

nei6<- select(NEI, fips, Emissions,type, year)
as.factor(nei6$year)
as.factor(nei6$type)
nei6<-filter(nei6, !is.na(Emissions), fips=="24510" | fips=="06037", type=="ON-ROAD")  

nei6<- nei6%>%
        mutate(City= ifelse(fips=="24510", "Baltimore", "Los Angeles"))%>%
        group_by(year,City)%>%
        summarise(pm25sum=sum(Emissions))

dev.copy(png, file="plot6.png", width=480, height=480)

ggplot(nei6, aes(year, pm25sum, col=City))+ 
        geom_line()+ 
        geom_point()+ 
        ggtitle("Baltimore vs Los Angeles Emission for Motor Vehicles by Year")+
        ylab("Emission")
dev.off()
