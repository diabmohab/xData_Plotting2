library(dplyr)
library(ggplot2)
nei3<- select(NEI, fips, Emissions,type, year)
as.factor(nei3$year)
as.factor(nei3$type)
nei3<-filter(nei3, !is.na(Emissions), fips=="24510")  

nei3<- nei3%>%
        group_by(year,type)%>%
        summarise(pm25sum=sum(Emissions))

dev.copy(png, file="plot3.png", width=480, height=480)

ggplot(nei3, aes(year, pm25sum, col=type))+ 
        geom_line()+ 
        geom_point()+ 
        ggtitle("Emissions in Baltimore City by Year")+
        ylab("Emission")
dev.off()
