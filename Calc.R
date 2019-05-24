
# 主函数
main <- function()
{
  sw <- read_excel("dasteel_file/RAMON_SW.xls")
  nc_table <- sw %>% select(-c(1,2,3)) %>% filter(浇铸钢种=="HRB400")
  t_1.4 <- nc_table %>% filter(比水量==1.4)
  t_1.4 <- t_1.4 %>% select(-contains('k'))
  foot_1.4 <- t_1.4 %>% select(contains('足辊'))
  sec1_1.4 <- t_1.4 %>% select(contains('一段'))
  sec2_1.4 <- t_1.4 %>% select(contains('二段'))
  sec3_1.4 <- t_1.4 %>% select(contains('三段'))
  names(foot_1.4) <-c('M','N','A','B','C')
  names(sec1_1.4) <-c('M','N','A','B','C')
  names(sec2_1.4) <-c('M','N','A','B','C')
  names(sec3_1.4) <-c('M','N','A','B','C')
  
  low_v <- seq(1.8,3.0,by=0.2)
  high_v <- seq(3.0,4.0,by=0.2)
  
  
}