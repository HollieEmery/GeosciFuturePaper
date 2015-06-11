#did this work?


if(.Platform$OS.type=="unix"){
  setwd("~/Dropbox/GFP_N2NarragansettBay")
}else{
  setwd("C:/Users/Hollie/Dropbox/GFP_N2NarragansettBay")
}

library(plotrix)
se<-function(x) sqrt(var(x,na.rm=TRUE)/length(na.omit(x)))

#### data import ####
dat=read.csv("Fig7.csv",header=TRUE)

# plot
mean=rbind(dat$N2fit_mean,dat$N2flux_mean)
sderr=rbind(dat$N2fit_stderr,dat$N2flux_stderr)

par(mai=c(1.4,1.4,1,.2))
plotCI(barplot(mean,
               col=c("steelblue4","maroon"),
               ylim=c(-200,1000),
               cex.axis=.7,
               ylab=expression(Net ~ Sediment ~ N[2]-N ~ Flux ~ (mu ~ mol ~ m^{-2} ~ hr^{-1})),
               cex.lab=.7,
               tcl=-.2,
               
               names=dat$Year,
               las=2, #makes labels perpendicular to axis
               cex.names=.7,
               #xaxt="n", #supresses x axis
               space=c(0,0),
               beside=TRUE, # as opposed to stacked
               border=NA
  ),
  mean,
  sderr,
  pch=NA, #suppresses center point on error bars
  sfrac=0, #suppresses serifs on error bars
  add=TRUE)
abline(h=0)

