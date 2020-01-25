# the goal of this file is to keep track of all devtools/usethis
# call you make for yout project

# Feel free to cherry pick what you need and add elements

# install.packages("desc")
# install.packages("devtools")
# install.packages("usethis")


# remotes::install_github("ropenscilabs/travis")
# remotes::install_github("ropenscilabs/tic")

# Hide this file from build
usethis::use_build_ignore("devstuff_history.R")
usethis::use_build_ignore("data-raw")
usethis::use_build_ignore("gitcommand")



# DESCRIPTION

library(desc)
# Create and clean desc
my_desc <- description$new("DESCRIPTION")
# Set your package name
my_desc$set("Package", "BeninStats")

#Set your name
my_desc$set("Authors@R", "person('Lewis', 'Hounkpevi', email = 'lewis.hounkpevi@gmail.com', role = c('cre', 'aut'))")

# Remove some author fields
my_desc$del("Maintainer")

# Set the version
my_desc$set_version("0.0.0.9000")

# The title of your package
my_desc$set(Title = "Benin Republic Global Statistics")
# The description of your package
my_desc$set(Description = "Collects different data from different sources for Benin Republic.")

# The urls
my_desc$set("URL", "https://github.com/Lorx/BeninStats")
my_desc$set("BugReports", "https://github.com/Lorx/BeninStats/issues")
# Save everyting
my_desc$write(file = "DESCRIPTION")

# If you want to use the MIT licence, code of conduct, lifecycle badge, and README
usethis::use_mit_license("Lewis Hounkpevi")
usethis::use_gpl3_license()
usethis::use_readme_rmd()
usethis::use_code_of_conduct()
usethis::use_lifecycle_badge("Experimental")
usethis::use_news_md()

usethis::use_pipe()

# For data
usethis::use_data(fertility_rate)
usethis::use_data(mortality_rate)
usethis::use_data(pop_by_age)
usethis::use_data(pop_compo)
usethis::use_data(climat)
usethis::use_data(climat2)
usethis::use_data(global_gender)
usethis::use_data(genre_violences)
usethis::use_data(business)
usethis::use_data(education)
usethis::use_data(infra)

devtools::document()

# For tests
usethis::use_testthat()
usethis::use_test("app")

# Dependencies
# usethis::use_package("shiny")
# usethis::use_package("DT")
# usethis::use_package("dplyr")
# usethis::use_package("tidyr")
# usethis::use_package("dygraphs")
# usethis::use_package("plotly")
# usethis::use_package("ggplot2")
# usethis::use_package("shinyalert")

# Reorder your DESC

usethis::use_tidy_description()

# Vignette
usethis::use_vignette("prenomsapp")
devtools::build_vignettes()

# Codecov
usethis::use_travis()
usethis::use_appveyor()
usethis::use_coverage()

# Test with rhub
rhub::check_for_cran()
# devtools::submit_cran()
