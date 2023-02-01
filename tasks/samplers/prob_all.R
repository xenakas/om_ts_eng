# install.packages("exams", repos="http://R-Forge.R-project.org")
# devtools::install_github("bdemeshev/rexamsconverter")

library(tidyverse)
library(rio)

library(exams)
# library(rexamsconverter)

files_df = tibble(filename = list.files('../base/', pattern = "Rmd", full.names = TRUE, recursive = TRUE))
files_df = filter(files_df, str_detect(filename, "prob"))

# to pdf:
res = exams2pdf_source(files_df$filename, date = "2019-09-27", add_seed = 777,
                 n_vars = 1,
                 title = "Теория вероятностей!", institution = "Поехали :)",
                 nops = FALSE, shuffle = TRUE,
                 template = "../templates/plain_no_sweave.tex",
                 
                 output_dir = "../snapshots/output_prob_all")


# to moodle!
res = exams2moodle(files_df$filename,
                   dir = '../snapshots/',
                   mchoice = list(shuffle = TRUE, enumerate = FALSE),
                   schoice = list(shuffle = TRUE, enumerate = FALSE))

