library(dplyr)
nei1<- select(NEI, Emissions, year)
as.factor(nei1$year)
nei1<-filter(nei1, !is.na(Emissions))  
        
nei1<- nei1%>%
        group_by(year)%>%
        summarise(pm25sum=sum(Emissions))

dev.copy(png, file="plot1.png", width=480, height=480)

plot(nei1$year,nei1$pm25sum, type='b', ylab='sum of Emissions by years', xlab='Year', col="red",ylim = c(min(nei1$pm25sum),max(nei1$pm25sum))  )

dev.off()
