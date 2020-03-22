covid<-read.csv("COVID-19/dati-andamento-nazionale/dpc-covid19-ita-andamento-nazionale.csv")
for(n in length(covid$totale_casi):2){
  covid$totale_casi[n] = covid$totale_casi[n] - covid$totale_casi[n-1]
}
cov.ts<-ts(covid$totale_casi)
main <- 'Daily trend of "New positive" cases of COVID-19 in Italy'
ylab<-"New positives"
xlab<-"Days since the beginning of data"
#png(filename="/home/berenluth/Projects/covid19/export.png", width = 1000, height=500, units="px")
png(filename="export.png", width = 1000, height=650, units="px")

plot(cov.ts, ylab=ylab, main=main, xlab=xlab)
points(covid$totale_casi)
tt<-as.numeric(time(cov.ts))
fit4<-lm(cov.ts~poly(tt,degree=4,raw=TRUE))
lines(tt,predict(fit4),col='red',lwd=2)
legend("bottomright",
       legend = "First day: 24/02/2020")

#dev.off()

