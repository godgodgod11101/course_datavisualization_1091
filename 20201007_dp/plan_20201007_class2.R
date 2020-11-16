library(readr)
library(dplyr)
library(lubridate)
library(stringr)
library(ggplot2)
library(svglite)
options(rstudio_drake_cache = storr::storr_rds("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20201007_dp/class2_1007_cache", hash_algorithm = "xxhash64"))
# no params in the frontmatter
# plan_20201007_class2------------
plan_20201007_class2=drake::drake_plan(
# > plan begins -----------
# >> dataImport_twcpi--------------

dataImport_twcpi = {
  library(xml2)
  
  read_xml("https://www.dgbas.gov.tw/public/data/open/Stat/price/PR0101A1M.xml") %>% 
    as_list()
},

# >> dataExtract--------------

dataExtract = {
  library(purrr)
  
  map(
    dataImport_twcpi$DataSet, 
    ~{
      (.x$Item == "總指數(民國105年=100)") & 
        (.x$TYPE == "年增率(%)")
    }
  ) %>% 
    unlist() ->    # change list to vector
    pick_105cpi
  
  head(pick_105cpi, 20)
  
  growthCPI <- dataImport_twcpi$DataSet[pick_105cpi]
  
  map_dfr(    # return a data frame created by row-binding
    seq_along(growthCPI), 
    ~{
      data.frame(
        項目 = growthCPI[[.x]]$Item[[1]], 
        年月 = growthCPI[[.x]]$TIME_PERIOD[[1]], 
        年增率 = growthCPI[[.x]]$Item_VALUE[[1]]
      )
    }
  )
},

# >> dataProcessing--------------

dataProcessing = {
  dataExtract %>% 
    mutate(
      年月日 = 年月 %>% 
        str_replace("M", "-") %>% 
        paste0("-01") %>% 
        lubridate::ymd(), 
      年增率百分比 = as.numeric(年增率)
    )
},

# >> baseCanvas--------------

baseCanvas = {
  dataProcessing %>% 
    ggplot()
},

# >> geom1_line--------------

geom1_line = {
  baseCanvas + 
    geom_line(
      mapping = aes(
        x = 年月日, 
        y = 年增率百分比
      )
    )
}

# > plan ends ------------
)

mk_plan_20201007_class2= function(...)
{
library(readr)
library(dplyr)
library(lubridate)
library(stringr)
library(ggplot2)
library(svglite)
options(rstudio_drake_cache = storr::storr_rds("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20201007_dp/class2_1007_cache", hash_algorithm = "xxhash64"))
# no params in the frontmatter
drake::make(plan_20201007_class2,
cache=drake::drake_cache(
  path="D:/Users/User/Documents/GitHub/course_datavisualization_1091/20201007_dp/class2_1007_cache"),...)
}
vis_plan_20201007_class2= function(...)
{
library(readr)
library(dplyr)
library(lubridate)
library(stringr)
library(ggplot2)
library(svglite)
options(rstudio_drake_cache = storr::storr_rds("D:/Users/User/Documents/GitHub/course_datavisualization_1091/20201007_dp/class2_1007_cache", hash_algorithm = "xxhash64"))
# no params in the frontmatter
drake::vis_drake_graph(plan_20201007_class2,
cache=drake::drake_cache(
  path="D:/Users/User/Documents/GitHub/course_datavisualization_1091/20201007_dp/class2_1007_cache"),...)
}
load_plan_20201007_class2= function(...)
{
drake::loadd(...,
cache=drake::drake_cache(
  path="D:/Users/User/Documents/GitHub/course_datavisualization_1091/20201007_dp/class2_1007_cache"), envir = .GlobalEnv)
}
