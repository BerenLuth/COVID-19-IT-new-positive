covid<-read.csv("COVID-19/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv")
for(n in length(covid$totale_casi):2){
  covid$totale_casi[n] = covid$totale_casi[n] - covid$totale_casi[n-1]
  covid$deceduti[n] = covid$deceduti[n] - covid$deceduti[n-1]
  covid$dimessi_guariti[n] = covid$dimessi_guariti[n] - covid$dimessi_guariti[n-1]
}
covid$data <- as.Date(covid$data)
cov.ts<-ts(covid$totale_casi)
main <- 'Daily data of "New positive" cases of COVID-19 in Italy'
ylab<-"# People"
xlab<-"Days since the beginning of data"
#png(filename="/home/berenluth/Projects/covid19/export.png", width = 1000, height=500, units="px")
png(filename="export.png", width = 1000, height=650, units="px")

plot(cov.ts, ylab=ylab, main=main, xlab=xlab, type='l', xaxs='i')
axis(1, covid$data, format(covid$data, "%b %d"))
grid()
#points(covid$totale_casi)
tt<-as.numeric(time(cov.ts))
fit4<-lm(cov.ts~poly(tt,degree=4,raw=TRUE))
lines(tt,predict(fit4),col="blue",lwd=1, type="c")
lines(covid$dimessi_guariti,col="green",lwd=2, type="l")
lines(covid$deceduti,col="red",lwd=2, type="l")

# legend("bottomright", legend = "First day: 24/02/2020")

legend("topleft",legend = c("New Positive","Recovered","Deaths", "Trend"),
       col=c("black","green","red", "blue"),lwd=2,lty=c(1,1,1,2)) # lty sets the type of line

#dev.off()

