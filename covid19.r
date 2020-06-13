covid<-read.csv("COVID-19/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv")
for(n in length(covid$totale_casi):2){
  covid$totale_casi[n] = covid$totale_casi[n] - covid$totale_casi[n-1]
  covid$deceduti[n] = covid$deceduti[n] - covid$deceduti[n-1]
  covid$dimessi_guariti[n] = covid$dimessi_guariti[n] - covid$dimessi_guariti[n-1]
  covid$tamponi[n] = covid$tamponi[n] - covid$tamponi[n-1]
}
covid$data <- as.Date(covid$data)
cov.ts<-ts(covid$totale_casi)
main <- 'Daily data of "New positive" cases of COVID-19 in Italy'
ylab<-"# People"
xlab<-"Days since the beginning of data"
#png(filename="/home/berenluth/Projects/covid19/export.png", width = 1000, height=500, units="px")
png(filename="export.png", width = 1000, height=650, units="px")

#ylim=x(0,40000) to change the plot scale to include number of tampons otherwise too big
plot(cov.ts, ylab=ylab, main=main, xlab=xlab, type='l', xaxs='i')
#plot(cov.ts, ylab=ylab, main=main, xlab=xlab, type='l', xaxs='i', ylim=c(0,60000))
axis(1, covid$data, format(covid$data, "%b %d"))
grid()
#points(covid$totale_casi)
#tt<-as.numeric(time(cov.ts))
#fit4<-lm(cov.ts~poly(tt,degree=3,raw=TRUE))
#lines(tt,predict(fit4),col="blue",lwd=1, type="l")
#lines(covid$dimessi_guariti,col="green",lwd=2, type="l")
#lines(covid$deceduti,col="red",lwd=2, type="l")
#lines(covid$tamponi,col="purple",lwd=2, type="l")

transparency=0.6
lwd=2

f <- 7
weights.s <- c(0.5, rep(1, f - 1), 0.5)/f

trend.s <- filter(cov.ts, filter=weights.s,side=2)
lines(trend.s,col='cornflowerblue',lwd=lwd, lty=3)

lines(covid$dimessi_guariti,col="limegreen",lwd=transparency, type="l")
trend.s <- filter(covid$dimessi_guariti, filter=weights.s,side=2)
lines(trend.s,col='limegreen',lwd=lwd, lty=3)

lines(covid$deceduti,col="red",lwd=transparency, type="l")
trend.s <- filter(covid$deceduti, filter=weights.s,side=2)
lines(trend.s,col='red',lwd=lwd, lty=3)




# legend("bottomright", legend = "First day: 24/02/2020")

legend("topleft",legend = c("New Positive","Recovered","Deaths", "Trend"),
       col=c("black","limegreen","red", "cornflowerblue"),lwd=2,lty=c(1,1,1,2)) # lty sets the type of line

#dev.off()

