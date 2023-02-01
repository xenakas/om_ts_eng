# install.packages("exams", repos="http://R-Forge.R-project.org")
# devtools::install_github("bdemeshev/rexamsconverter")

library(tidyverse)
library(rio)

library(exams)
library(rexamsconverter)

# Sys.which("latexmk") # check whether latex is present and specify path to latexmk
# latex_executable <- Sys.which("pdflatex")
# options(texi2dvi = latex_executable)


files_df = tibble(filename = list.files('../base/', pattern = "*.Rmd", full.names = TRUE, recursive = TRUE))
files_df = filter(files_df, str_detect(filename, "week1"))

res = exams2pdf_source(files_df$filename, date = "2019-09-27", 
                       add_seed = 777,
                 n_vars = 1, title = "Week 1", 
                 institution = "Run :)", nops = FALSE, shuffle = TRUE,
                 template = "../templates/plain_no_sweave.tex",
                 
                 output_dir = "../snapshots/demo")



