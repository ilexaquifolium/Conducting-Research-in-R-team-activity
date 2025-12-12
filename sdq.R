#Import data
library(readxl)
Q5_data <- read_excel("Downloads/Q5_data.xlsx")
View(Q5_data)

#Clean fm column
install.p
library(dplyr)

Q5_data <- Q5_data %>%
  mutate(
    sex_clean = case_when(
      startsWith(tolower(Sex), "m") ~ 1,
      startsWith(tolower(Sex), "f") ~ 0,
      TRUE ~ NA_real_
    )
  )

View(Q5_data)
unique(Q5_data$Sex)

#Clean year column
Q5_data <- Q5_data %>%
  mutate(
    age_2025 = 2025 - DOBYear
  )

View(Q5_data)

#Show age in years based on DOBYear
Q5_data <- Q5_data %>%
  mutate(
    age_2025_inmonths = age_2025*12
  )

View(Q5_data)


#Clean month column
Q5_data <- Q5_data %>%
  mutate(
    Month_birth_num = match(
      substr(tolower(trimws(DOBMonth)), 1, 3),
      c("jan", "feb", "mar", "apr", "may", "jun",
        "jul", "aug", "sep", "oct", "nov", "dec")
    )
  )
View(Q5_data)


#Total age in years
Q5_data <- Q5_data %>%
  mutate(
    total_age = (age_2025_inmonths + Month_birth_num)/12
  )
View(Q5_data)
