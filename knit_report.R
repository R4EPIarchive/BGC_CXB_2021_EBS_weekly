################## Knit reports ################################################
library(tsibble)
library(lubridate)

## Week data are from
week_report <- as.character(yearweek(Sys.Date(),
                               week_start = 7) -1)

# Previous month to current month
month_report <- format(floor_date(rollback(Sys.Date(),
                                        roll_to_first = FALSE),
                             unit = "month"), "%B-%Y")




## use the rmarkdown template and save a sitrep  in the appropriate week folder
## Weekly report
 rmarkdown::render(input = here::here("code", "ebs_report.Rmd"),
                    output_file = stringr::str_glue("ebs_report", "_",
                                                    week_report, ".docx"),
                    output_dir = here::here("2021", "4_output"))
 
## Monthly report
 rmarkdown::render(input = here::here("code", "ebs_report_monthly.Rmd"),
                   output_file = stringr::str_glue("ebs_monthly_report", "_",
                                                   month_report, ".docx"),
                   output_dir = here::here("2021", "4_output"))
 
 
