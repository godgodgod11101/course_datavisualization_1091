# 不要改此label

library(readr)
library(dplyr)
library(ggplot2)
library(svglite)
options(rstudio_drake_cache = storr::storr_rds("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/.testDrake_cache", hash_algorithm = "xxhash64"))
params=readRDS("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/params_testDrake.rds")
# plan_testDrake------------
plan_testDrake=drake::drake_plan(
# > plan begins -----------
# >> downloaddata--------------
downloaddata = {
  taiwanStatistics <- readr::read_csv(
    "https://www.dropbox.com/s/n6fuvpo4cbz0oth/taiwanEconomicGrowth.csv?dl=1")
  taiwanStatistics
},

# >> dataReady--------------
dataReady = {
  downloaddata %>%
  rename(
    "year"="X1"
  ) %>%
  mutate(
    across(
      everything(),
      as.numeric
    )
  )
},

# >> gg_taiwanEconomicGrowth--------------
gg_taiwanEconomicGrowth = {
  dataReady %>%
    ggplot()+
    geom_line(
      aes(
        x=year, y=`economic growth rate(%)`
      )
    )
},

# >> save_gg_taiwanEconomicGrowth--------------
save_gg_taiwanEconomicGrowth = {
  ggsave(
    "taiwanEconomicsGrowth.svg",
    gg_taiwanEconomicGrowth,
    width=8,
    height=5
  )
  
}

# > plan ends ------------
)

mk_plan_testDrake= function(...)
{
# 不要改此label

library(readr)
library(dplyr)
library(ggplot2)
library(svglite)
options(rstudio_drake_cache = storr::storr_rds("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/.testDrake_cache", hash_algorithm = "xxhash64"))
params=readRDS("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/params_testDrake.rds")
drake::make(plan_testDrake,
cache=drake::drake_cache(
  path="D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/.testDrake_cache"),...)
}
vis_plan_testDrake= function(...)
{
# 不要改此label

library(readr)
library(dplyr)
library(ggplot2)
library(svglite)
options(rstudio_drake_cache = storr::storr_rds("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/.testDrake_cache", hash_algorithm = "xxhash64"))
params=readRDS("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/params_testDrake.rds")
drake::vis_drake_graph(plan_testDrake,
cache=drake::drake_cache(
  path="D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/.testDrake_cache"),...)
}
load_plan_testDrake= function(...)
{
drake::loadd(...,
cache=drake::drake_cache(
  path="D:/Users/User/Documents/GitHub/course_datavisualization_1091/20200930_dp/.testDrake_cache"), envir = .GlobalEnv)
}
