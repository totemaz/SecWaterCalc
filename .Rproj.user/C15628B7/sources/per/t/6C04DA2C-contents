require(tidyverse)
require(readxl)
require(RODBC)
# 计算拉速区间0.4-3.0的水量
calcw1 <- function(w_table)
{
  Q <- v*w_table$M+w_table$N
  return(Q)
}

# 计算拉速3.5以上的水量
calcw2 <- function(w_table)
{
  y2 <- v^2*w_table$A+v*w_table$B+w_table$C
  return(Q)
}

# 连接读取access数据库表
connmdb <- function()
{
  
}