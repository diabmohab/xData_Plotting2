library(dplyr)
nei2<- select(NEI, fips, Emissions, year)
as.factor(nei1$year)
nei2<-filter(nei2, !is.na(Emissions), fips=="24510")  

nei2<- nei2%>%
        group_by(year)%>%
        summarise(pm25sum=sum(Emissions))

dev.copy(png, file="plot2.png", width=480, height=480)

plot(nei2$year,nei2$pm25sum, type='b', ylab='sum of Emissions in Baltimore City by years', xlab='Years', col="red",ylim = c(min(nei2$pm25sum),max(nei2$pm25sum))  )

dev.off()
