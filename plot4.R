library(dplyr)
library(ggplot2)
nei4<- merge(NEI,SCC, by="SCC")
nei4<- select(nei4, Emissions,Pollutant, year,Short.Name)
as.factor(nei4$year)

nei4<-filter(nei4, !is.na(Emissions),grepl("coal",Short.Name, ignore.case=TRUE) )  

nei4<- nei4%>%
        group_by(year)%>%
        summarise(pm25sum=sum(Emissions))

dev.copy(png, file="plot4.png", width=480, height=480)

ggplot(nei4, aes(year, pm25sum))+ 
        geom_line()+ 
        geom_point()+ 
        ggtitle("Emissions from Coal Sources in the US. by Year")+
        ylab("Emission")
dev.off()
