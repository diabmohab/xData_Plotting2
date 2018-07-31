library(dplyr)
library(ggplot2)
nei5<- select(NEI, fips, Emissions,type, year)
as.factor(nei5$year)
as.factor(nei5$type)
nei5<-filter(nei5, !is.na(Emissions), fips=="24510" & type=="ON-ROAD")  

nei5<- nei5%>%
        group_by(year, type)%>%
        summarise(pm25sum=sum(Emissions))

dev.copy(png, file="plot5.png", width=480, height=480)

ggplot(nei5, aes(year, pm25sum))+ 
        geom_line()+ 
        geom_point()+ 
        ggtitle("Emissions in Baltimore City for motor Vehicles by Year")+
        ylab("Emission")
dev.off()
