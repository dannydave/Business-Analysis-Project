#############################################################
#### setup your machines in preparation to the Coursework
#############################################################



# check that all the following packages are installed:


# 'dplyr', 'devtools', 'ggplot2', 'quantmod'
# 'XBRL', 'finreportr', 'cowplot', 'Rmisc', 'gridExtra'


# if these are not installed, please install them using e.g.

install.packages(c('dplyr', 'devtools', 'ggplot2', 'quantmod'))

install.packages(c('XBRL', 'finreportr', 'cowplot', 'Rmisc', 'gridExtra'))


# you will then need to install another package from github. 
# To do that you need to have the package devtools already installed.
# if you have already installed the following package, you can skip this step. 
# Otherwise just run:

library(devtools)
install_github("bergant/finstr")


# After you installed all the above packages, ahe final check can be done running:

library(plyr)
library(dplyr)
library(XBRL)
library(finreportr)
library(devtools)
library(ggplot2)
library(cowplot)
library(quantmod)
library(Rmisc)
library(gridExtra)
library(finstr)

# if you do not see any error messages then you are all set. 
# if you see warning messages don't worry, that's fine anyway. 
