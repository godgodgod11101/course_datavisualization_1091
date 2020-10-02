# 在R project底下建立“hw”資料夾（此文件需存在與project同層）
dir.create("./hw")


# 在“hw”內建立“rData”資料夾
frontPath <- "./hw"
folderName <- "rData"
fullPath <- file.path(frontPath, folderName)    # 形成R可識別的路徑
dir.create(fullPath)

# 若 “hw/rData” 路徑不存在
dir.create(fullPath)    # No such file or directory! 
dir.create(fullPath, recursive = T)


# 在“hw”內建立“rGraph”與“rSVG”資料夾
dirname(fullPath)    # exclude the last path separator
vec_fullPath <- file.path(dirname(fullPath), c("rGraph", "rSVG"))
purrr::map(vec_fullPath, ~{dir.create(.x)})

