a <- 3
cc <- 15

# drake plan架構（名為examplePlan）
examplePlan <- drake::drake_plan(
  target1 = {    # 每個target對應Rmd一個dp code chunk內容
    a + 5 -> b
    cc <- 0
    if (b < 10) b 
  },
  target2 = {
    cc 
  },
  target3 = {
    target1 + a
  }
)



# # console流程
# library(drake)
# 
# cacheDir <- file.path(
#   root(),
#   file.path("20201014_basic4dp", "basic4dp_cache")
# )
# 
# # 建立dp，並自行建立dp cache
# make(
#   examplePlan,
#   cache = new_cache(cacheDir)
# )

# # 查看dp流程圖
# vis_drake_graph(examplePlan, cache = drake_cache(cacheDir))

# # load dp物件（與load target at cursor相同）
# loadd(target1, path = cacheDir)



# # 若要使dp重新make一次，clean() -> make()
# clean(path = cacheDir)
# 
# vis_drake_graph(examplePlan, cache = drake_cache(cacheDir))    # 所有target變黑色（outdated）
# 
# make(
#   examplePlan,
#   cache = new_cache(cacheDir)
# )

# # 重make某個target
# clean(target1, path = cacheDir)
# 
# vis_drake_graph(examplePlan, cache = drake_cache(cacheDir))    # target1之後都變黑色（outdated）
# 
# make(
#   examplePlan,
#   cache = new_cache(cacheDir)
# )



