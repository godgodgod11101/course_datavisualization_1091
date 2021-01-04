# ［...］若在函數中出現，它可代表任意input

## eg.1

root("myScript.R")   # ［...］為［"myScript.R"］

## eg.2

addPercent <- function(x, mult = 100, ...){ 
  percent <- round(x * mult, ...) 
  paste0(percent, "%") 
}

addPercent(c(0.355, 0.674))
addPercent(c(0.355, 0.674), digits = 1)    # ［...］為［digits = 1］
