getwd()
setwd("C:/15003570037/Practical_List Programs")
peopletxt <- file.choose()

people <- read.delim(peopletxt, header = TRUE, sep = "|", dec = ".")
people

install.packages("sqldf")
library(sqldf)

age_zero_to_fifty <- "SELECT * FROM people 
                      WHERE age > 0 
                      AND age < 150"
result1 <- sqldf(age_zero_to_fifty)
result1

age_greaterthan_yearsmarried <- "SELECT * FROM people
                                  WHERE age > yearsmarried"
result2 <- sqldf(age_greaterthan_yearsmarried)
result2

status <- "SELECT * from people 
            WHERE status = 'single' OR
                  status = 'married' OR
                  status = 'widowed'
          "
result3 <- sqldf(status);
result3

query_from_people<- "SELECT
                     age,
                    agegroup,
height,
status,
yearsmarried

FROM
people
where
(age<18 and agegroup = 'child') or 
((age between 18 and 65) and agegroup ='adult') or
(age >65 and agegroup ='elderly')"
result4 <- sqldf(query_from_people)
result4

summary(people)

boxplot(people)

