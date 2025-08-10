## MATH525 Workshop 6

# new.wd <- "path to your working directory folder, set this as appropriate"     

setwd(new.wd)      # change the wd

getwd()            # check the new wd          


eval(call(load('banR.R')))

rm(ls)

install.packages(c("quantmod", "TTR", "PerformanceAnalytics"))
library(quantmod)
library(TTR)
library(PerformanceAnalytics)

# Define the UK stock symbols
uk.symbols <- c( 'AAF.L', 'VOD.L', 'AZN.L', 'BP.L', 'CRH.L', 'HSBA.L', 'ULVR.L', 'GSK.L', 'CPG.L', 'SHEL.L', 'DGE.L', 'RIO.L', 'ISF.L', 'GLEN.L', 'REL.L', 'LLOY.L', 'RR.L', 'WG.L', 'NG.L', 'PRU.L')

# Download Yahoo data for UK stocks
tmp.uk <- new.env()

getSymbols.yahoo(uk.symbols, env = tmp.uk, from = '2020-03-06')

rm(ls)

# Check if download successful
ls(tmp.uk)  # should return the symbols of downloaded data

# Save the data on disk for later usage
save(tmp.uk, file = 'ukstocks.R')

# Later, you can use these data again by re-loading data
load(file = 'ukstocks.R')  # data are in the environment tmp

# Check the symbols of loaded data
ls(tmp.uk)  # should return the symbols of loaded data

# Run the CAPM analysis on UK stocks
capm.uk = capm.fit(x=tmp.uk, mkt='ISF.L')

names(capm.uk)

capm.uk$capm

# Load the new package
library(PortfolioAnalytics)

portf.uk <- portfolio.fit(x=capm.uk, target = 'min.stdv', rp.method = 'simplex')

names(portf.uk)

portf.uk[4:5]

chart.Weights(portf.uk$opt, plot.type = 'barplot')

plot(portf.uk$c.rets, main = 'Cumulative returns')


cor(capm.uk$stk)
round(cor(capm.uk$stk),2)

# Compute annualized returns

round(table.AnnualizedReturns(R = portf.uk$rets/100, scale=252),3)

attach(tmp.uk)

Vodafone.price <- VOD.L[ ,4]
Vodafone_Group.logret <- diff(log(Vodafone.price))
Vodafone_Group.logret[1] <- 0
plot(Vodafone_Group.logret)


Airtel.price <- AAF.L[,4]
Airtel_Africa.logret <- diff(log(Airtel.price))
Airtel_Africa.logret[1] <- 0
plot(Airtel_Africa.logret)
