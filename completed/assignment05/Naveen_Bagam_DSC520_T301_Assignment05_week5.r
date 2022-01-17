Using the dplyr package, use the 6 different operations to analyze/transform the data - 
GroupBy, Summarize, Mutate, Filter, Select, and Arrange – Remember this isn’t just 
modifying data, you are learning about your data also – so play around and start to understand your dataset in more detail

data_house <- read_xlsx("week-7-housing.xlsx")

#GroupBy:-

> data_house %>%
+ group_by(square_feet_total_living) %>% 
+ summarise(n = n())
# A tibble: 654 x 2
   square_feet_total_living     n
                      <dbl> <int>
 1                      240     1
 2                      310     1
 3                      340     1
 4                      410     1
 5                      430     1
 6                      480     2
 7                      530     1
 8                      540     1
 9                      550     2
10                      570     1
# ... with 644 more rows
> 


#Summarize:-


summarise(data_house, square_feet_total_livings = mean(data_house$square_feet_total_living,na.rm = TRUE ))
# A tibble: 1 x 1
  square_feet_total_livings
                      <dbl>
1                     2540.summarise(data_house, square_feet_total_livings = mean(data_house$square_feet_total_living,na.rm = TRUE ))
# A tibble: 1 x 1
  square_feet_total_livings
                      <dbl>
1                     2540.


#Mutate:-

data_house1 <- mutate(data_house, years_old = as.numeric (format(as.Date(data_house$`Sale Date`), "%Y")) - year_built)


#Filter:-

filter(data_house1 ,years_old > 10)

#Select:-

select(data_house1,`Sale Date`, years_old)

#Arrange:-

> arrange(data_house1,desc(years_old), `Sale Date`)



Using the purrr package – perform 2 functions on your dataset.  You could use zip_n, keep, discard, compact, etc.

keep:-

data_house1$years_old %>% keep(~ .x  > 10)

discard :-

data_house1$years_old %>% discard(~ .x  > 10)


compact :-

data_house1$years_old %>% compact(~ .x)


Use the cbind and rbind function on your dataset

#cbind:- 

> cbind_hdata <- cbind(data_house,data_house1)
> colnames(cbind_hdata)
 [1] "Sale Date"                "Sale Price"              
 [3] "sale_reason"              "sale_instrument"         
 [5] "sale_warning"             "sitetype"                
 [7] "addr_full"                "zip5"                    
 [9] "ctyname"                  "postalctyn"              
[11] "lon"                      "lat"                     
[13] "building_grade"           "square_feet_total_living"
[15] "bedrooms"                 "bath_full_count"         
[17] "bath_half_count"          "bath_3qtr_count"         
[19] "year_built"               "year_renovated"          
[21] "current_zoning"           "sq_ft_lot"               
[23] "prop_type"                "present_use"             
[25] "Sale Date"                "Sale Price"              
[27] "sale_reason"              "sale_instrument"         
[29] "sale_warning"             "sitetype"                
[31] "addr_full"                "zip5"                    
[33] "ctyname"                  "postalctyn"              
[35] "lon"                      "lat"                     
[37] "building_grade"           "square_feet_total_living"
[39] "bedrooms"                 "bath_full_count"         
[41] "bath_half_count"          "bath_3qtr_count"         
[43] "year_built"               "year_renovated"          
[45] "current_zoning"           "sq_ft_lot"               
[47] "prop_type"                "present_use"             
[49] "years_old"               
> 
rbind:-

rbind(new_bindhouse,data_house1)

Split a string, then concatenate the results back together

Split String:-

df=data.frame(do.call("rbind", strsplit(as.character(rs), " ", fixed = TRUE)))

> df
    X1 X2    X3 X4     X5      X6
1 This is First  R String Example

concatenate (Paste):-

totstr <- paste(df$X1,df$X2, df$X3, df$X4, df$X5, df$X6, sep=" ")

> totstr
[1] "This is First R String Example"

