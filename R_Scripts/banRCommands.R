library("plyr")
library("dplyr")
library("readr")
library("XBRL")
library("finreportr")
library("devtools")
library("ggplot2")
library("cowplot")
library("quantmod")
library("Rmisc")
library("grid")
library("gridExtra")
library("finstr")

## download the files from DLE into a folder (e.g. here it is 'STO7009\\code')
## then set the working directory to this folder

# new.wd <- paste0(Sys.getenv('USERPROFILE'), "C:/Users/User/Downloads/Math525/Coursework/Coursework FIles")      # path to wd
# 
# setwd(new.wd)      # change the wd
# 
# getwd()            # check the new wd        




# load the software-------------------------------------------------------------

eval(call(load('banR.R')))




# set some parameters for the session-------------------------------------------

options(dplyr.print_max = 1000)
options(warn = -1)
options(stringsAsFactors = FALSE)
options(HTTPUserAgent = "name_surname   name_surname@domain.com")


#################
# CW statements
#################


# create bs and is statements in R for the two companies------------------------

Airtel_Africa.bs = make.statement(template='bs_template_Airtel_Africa.csv', skeleton="bs_skeleton.R", digits = 2) 

Airtel_Africa.is = make.statement(template='is_template_Airtel_Africa.csv', skeleton="is_skeleton.R", digits = 2) 


Vodafone_Group.bs = make.statement(template='bs_template_Vodafone_Group.csv', skeleton="bs_skeleton.R", digits = 2) 

Vodafone_Group.is = make.statement(template='is_template_Vodafone_Group.csv', skeleton="is_skeleton.R", digits = 2) 




# check statements--------------------------------------------------------------

check_statement(Airtel_Africa.bs)

check_statement(Airtel_Africa.is)

check_statement(Vodafone_Group.bs)

check_statement(Vodafone_Group.is)




# plots for simplified bs and full is statements for Airtel_Africa-------------------------------------

Airtel_Africa.bss <- simplify.bs(Airtel_Africa.bs)

plot.bsf(bsf=Airtel_Africa.bss)

plot.isf(isf=Airtel_Africa.is, dates=c(1,2))



# plots for simplified bs and full is statements for Vodafone_Group-------------------------------------

Vodafone_Group.bss <- simplify.bs(Vodafone_Group.bs)

plot.bsf(bsf=Vodafone_Group.bss)

plot.isf(isf=Vodafone_Group.is, dates=c(1,2))



# horizontal and vertical analyses for bs and is statements of Airtel_Africa-----------------------------

knitr::kable(horizonal.analysis(fs=Airtel_Africa.bs, type='bs', units = 1000000))

vertical.analysis(fs=Airtel_Africa.bs, type = 'bs', total = NULL)

knitr::kable(horizonal.analysis(fs=Airtel_Africa.is, type='is', units = 1000000))

vertical.analysis(fs=Airtel_Africa.is, type = 'is', total = NULL)



# horizontal and vertical analyses for bs and is statements of Vodafone_Group------------------------------

knitr::kable(horizonal.analysis(fs=Vodafone_Group.bs, type='bs', units = 1000000))

vertical.analysis(fs=Vodafone_Group.bs, type = 'bs', total = NULL)

knitr::kable(horizonal.analysis(fs=Vodafone_Group.is, type='is', units = 1000000))

vertical.analysis(fs=Vodafone_Group.is, type = 'is', total = NULL)



# Some Ratio Analysis for Airtel Africa-----------------------------------------

Airtel_Africa.all = merge(Airtel_Africa.bs, Airtel_Africa.is)    

Airtel_Africa.ratios <- fin.ratios(fstats=Airtel_Africa.all, ratios=c(profit.margins, bsf.ratios, isf.ratios))

Airtel_Africa.ratios

plot(Airtel_Africa.ratios[,1:3], main='',type='b')



# Some Ratios Analysis for Vodafone Group---------------------------------------


Vodafone_Group.all = merge(Vodafone_Group.bs, Vodafone_Group.is) 

Vodafone_Group.ratios <- fin.ratios(fstats=Vodafone_Group.all, ratios=c(profit.margins, bsf.ratios, isf.ratios))

Vodafone_Group.ratios

plot(Vodafone_Group.ratios[,1:3], main='',type='b')

