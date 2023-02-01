# install.packages("exams", repos="http://R-Forge.R-project.org")
# devtools::install_github("bdemeshev/rexamsconverter")

library(tidyverse)
library(rio)

library(exams)
# library(rexamsconverter)

# Sys.which("latexmk") # check whether latex is present and specify path to latexmk
# latex_executable <- Sys.which("pdflatex")
# options(texi2dvi = latex_executable)


past_folders = list.dirs('../base/', recursive = FALSE, full.names = FALSE)
past_folders

past_folder = "~/Downloads/Simple_probability_old/"


  in_folder = past_folder
  files_df = tibble(filename = list.files(in_folder, pattern = "*.Rmd", full.names = TRUE, recursive = TRUE))
  # files_df = filter(files_df, str_detect(filename, "prob_2019"))
  message('Folder: ', past_folder)
  message('Rmd files: ', nrow(files_df))

  out_folder = paste0('~/Downloads/canvas_exp/')
  dir.create(out_folder, recursive = TRUE)

  res = exams2canvas(files_df$filename, dir = out_folder, name = "yyy")

  out_folder = paste0('~/Downloads/canvas_exp/')
  dir.create(out_folder, recursive = TRUE)


  out_folder = paste0('~/Downloads/black_exp/')
  dir.create(out_folder, recursive = TRUE)
  res = exams2blackboard(files_df$filename, edir = out_folder)


  out_folder = paste0('~/Downloads/mood_exp/')
  dir.create(out_folder, recursive = TRUE)


 res = exams2moodle(files_df$filename, edir = out_folder)
# res = exams2arsnova(files_df$filename, edir = out_folder)
# res = exams2openolat(files_df$filename, edir = out_folder)
# res = exams2tcexam(files_df$filename, edir = out_folder)

res

