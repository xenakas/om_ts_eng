library(tidyverse)
library(rio)

library(exams)
library(rexamsconverter)


addon = '
exextra[Type]: Calculation
exextra[Language]: Russian
exextra[Level]: Statistical Reasoning
exsection: Unclassified
'

files_df = tibble(filename = list.files('~/Dropbox/probability_bank_exam_2021 (1)/', pattern = "*.Rmd", full.names = TRUE, recursive = TRUE))

for (fname in files_df$filename) {
  content = read_file(fname)
  if (!str_detect(content, 'exsection')) {
    print(fname)
    new_content = paste0(str_trim(content, 'right'), addon)
    write_file(new_content, file = fname)
  }
}
