#### Creating a Manhattan plot with R #####

# Lucas Kopecky Bobadilla - University of Illinois - Urbana-Champaign
# IF YOU WANT TO USE THIS CODE FOR A PUBLICATION, PLEASE CITE THE REPOSITORY GITHUB LINK
# The tutorial for this code can be found at: https://www.openweedsci.org/post/2020/03/18/gwas-data-visualization-in-r/


# Packages
library(tidyverse) # tidyverse packages
library(RColorBrewer) # complement to ggplot
library(ggrepel) # complement to ggplot
library(kableExtra) # table layout


# load data - not real human SNP dataset generate from Plink
plink.result <- read_table2("data/analysis1.assoc.logistic") # change to your root directory

head(plink.result) # get first 5 lines

glimpse(plink.result) # check data stucture


# data cleaning step
df_clean <- plink.result %>% 
  filter(TEST == "ADD") %>% 
  select(-X10) #  Remove all rows that don’t correspond to testing the SNP effect 

fac <- c("CHR","SNP", "A1", "TEST") # select columns to be factor

df_clean[fac] <- lapply(df_clean[fac], factor) # transform columns to factor

glimpse(df_clean) # check new data stucture
