
create_materializedFramework <- function(){
  downloadUrl <- "https://www.dropbox.com/s/oz385kxex63yoa6/MaterializedFramework.zip?dl=1"
  download_unzip(downloadUrl)
}

download_unzip <- function(downloadUrl){
  stringr::str_remove(
    basename(downloadUrl),    # 保留路徑（網址）中最後一個“/”後面的部分
    "\\?[:graph:]+$"    # 結尾是"?..."（[:graph:]包含所有字元）
  ) -> 
    fileName
  
  download.file(
    url = downloadUrl,
    destfile = fileName, 
    mode = "wb"    # "wb" for Windows
  )
  
  unzip(
    zipfile = fileName
  )
  
  unlink(fileName)    # 刪除file
}


