
library(BayesFactor)
library(tidyr)
library(ggstatsplot)
df <- read.csv('all_subjs_extra_information_PEEG.csv')

ttestBF(df$BF.window_stim, df$BF.window_sham, paired = T)


data_long <- gather(olddata_wide, condition, measurement, control:cond2, factor_key=TRUE)


df_long <- gather(df, condition, measurement, BF.window_stim:BF.window_sham,  factor_key=TRUE )

ggwithinstats(
  data=df_long,
  x=condition,
  y=measurement,
  boxplot.args=list(width = 0.0, alpha = 1.0),
)

ggwithinstats(
  data=df_long,
  x=condition,
  y=measurement)


# eeg BF analysis
setwd("C:/Users/lloydb/surfdrive/ExperimentData/PEEG_TVNS/analysis/eeg")
df_eeg <- read.csv('PEEG_eeg_sharon.csv', sep = ';')


fin_dat <- df_eeg [-c(1, 11), ] 


ttestBF(df_eeg$tvns, df_eeg$sham, paired = T)
wilcox.test(df_eeg$tvns, df_eeg$sham, alternative = "two.sided")
