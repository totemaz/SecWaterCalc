
# 主函数
main <- function()
{
  sw <- read_excel("dasteel_file/RAMON_SW.xls")
  nc_table <- sw %>% select(-c(1,2,3)) %>% filter(浇铸钢种=="HRB400")
  t_1.6 <- nc_table %>% filter(比水量==1.6)
  t_1.6 <- t_1.6 %>% select(-contains('k'))
  foot_1.6 <- t_1.6 %>% select(contains('足辊'))
  sec1_1.6 <- t_1.6 %>% select(contains('一段'))
  sec2_1.6 <- t_1.6 %>% select(contains('二段'))
  sec3_1.6 <- t_1.6 %>% select(contains('三段'))
  names(foot_1.6) <-c('M','N','A','B','C')
  names(sec1_1.6) <-c('M','N','A','B','C')
  names(sec2_1.6) <-c('M','N','A','B','C')
  names(sec3_1.6) <-c('M','N','A','B','C')
  
  low_v <- seq(1.8,3.0,by=0.2)
  high_v <- seq(3.0,4.0,by=0.2)
  
  
}


sw <- read_excel("dasteel_file/RAMON_SW.xls")
nc_table <- sw %>% select(-c(1,2,3)) %>% filter(浇铸钢种=="HRB400")
t_1.6 <- nc_table %>% filter(比水量==1.6)
t_1.6 <- t_1.6 %>% select(-contains('k'))
foot_1.6 <- t_1.6 %>% select(contains('足辊'))
sec1_1.6 <- t_1.6 %>% select(contains('一段'))
sec2_1.6 <- t_1.6 %>% select(contains('二段'))
sec3_1.6 <- t_1.6 %>% select(contains('三段'))
names(foot_1.6) <-c('M','N','A','B','C')
names(sec1_1.6) <-c('M','N','A','B','C')
names(sec2_1.6) <-c('M','N','A','B','C')
names(sec3_1.6) <-c('M','N','A','B','C')

low_v <- seq(1.8,3.0,by=0.2)
high_v <- seq(3.2,4.0,by=0.2)

dt.water <- data.frame()

dt.foot.water <- getWater(foot_1.6)
dt.sec1.water <- getWater(sec1_1.6)
dt.sec2.water <- getWater(sec2_1.6)
dt.sec3.water <- getWater(sec3_1.6)

dt.water <- rbind(dt.foot.water,dt.sec1.water,dt.sec2.water,dt.sec3.water)


write.csv(dt.water,'water_res.csv',row.names = F)


vid <- read_excel('dasteel_file/CoolingPracticeVelocity.xlsx')
vid <- vid %>% filter(WaterTableID==104) %>% select(ID)

water <- read_excel('dasteel_file/Water.xlsx')
water_104_2 <- water %>% inner_join(vid,by = c('VelocityID'='ID')) %>% arrange(circuorder,VelocityID)
write.csv(water_104_2,'water_104.csv',row.names = F)

