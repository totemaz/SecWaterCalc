require(tidyverse)
require(readxl)
require(RODBC)
# 计算拉速区间0.4-3.0的水量
calcw1 <- function(w_table,v)
{
  Q <- v*w_table$M+w_table$N
  return(Q)
}

# 计算拉速3.5以上的水量
calcw2 <- function(w_table,v)
{
  Q <- v^2*w_table$A+v*w_table$B+w_table$C
  return(Q)
}

getWater <- function(w_table)
{
  q1 <- calcw1(w_table,low_v)
  q2 <- calcw2(w_table,high_v)
  dt.w <- data.frame(water=c(q1,q2)*1000/60)
  return(dt.w)
}
# 连接读取access数据库表
connmdb <- function()
{
  
}