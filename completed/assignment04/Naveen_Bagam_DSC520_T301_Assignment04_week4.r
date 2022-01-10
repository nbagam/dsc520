1.Test Scores
  i) Use the appropriate R functions to answer the following questions:
    
	 1)What are the observational units in this study?
  
        df_score <- read.csv("scores.csv", header = TRUE, sep = ",")
		
		df_score %>% select(Score)
		
	 2)Identify the variables mentioned in the narrative paragraph and determine which are categorical and quantitative?	
		
	 	"Section" column is the Categorial varibal ein the score.csv file
		
		> df_score %>% select(Section)
		
		"Score" and "Count" column is the quantitative .
		
		> df_score %>% select(Score, Count)
		
	 3) Create one variable to hold a subset of your data set that contains only the Regular Section and one variable for the Sports Section.	
	 
	    
     	> library(dplyr) 
        > Regular_data <- filter(df_score,Section=="Regular")
        > Regular_data
		
		> Sports_data <- filter(df_score,Section=="Sports")
		> Sports_data
		
	4) Use the Plot function to plot each Sections scores and the number of students achieving that score. Use additional 
	   Plot Arguments to label the graph and give each axis an appropriate label. Once you have produced your Plots answer 
	   the following questions:

       
		   > plot(Sports_data$Score, Sports_data$Count, type = "p", xlab = 'Score', ylab ="No of students")
           > plot(Regular_data$Score, Regular_data$Count, type = "p", xlab = 'Score', ylab ="No of students")
		   
		    a)Comparing and contrasting the point distributions between the two section, looking at both tendency and consistency: 
			  Can you say that one section tended to score more points than the other? Justify and explain your answer.	
		
		      Yes, In the regular section most of the Students scored more than 290 and only 20 students are below 280 where as "Sports"
			  students scores started at 200 and 70 students scores are below or equal to 250 , so obviously Regular section students are
			  tend to Score more points
			  
			  
			b) Did every student in one section score more points than every student in the other section? If not,
  			   explain what a statistical tendency means in this context.
		   
		       No,
			   
 			   In statistics, the central tendency is the descriptive summary of a data set. Through the single value from the dataset, 
			   it reflects the centre of the data distribution. Moreover, it does not provide information regarding individual data from the
			   dataset,where it gives a summary of the dataset. Generally, the central tendency of a dataset can be defined using Mean, Median
			   and Mode measures in statistics.
             
               Following is the Mean values of data set given			 
			  
			   > mean(Sports_data$Score)
                 [1] 307.3684
               > mean(Regular_data$Score)
                 [1] 327.6316
				 
			   Following is the Medina values of given data set
			   
			   > median(Regular_data$Score)
                 [1] 325
               > median(Sports_data$Score)
                 [1] 315
				 
			   Follwoing is the Mode of the data set

                 > v <- c(Sports_data$Score)
                 > v1 <- c(Regular_data$Score)	

                 > getmode <- function(v) {
                   +    uniqv <- unique(v)
                   +    uniqv[which.max(tabulate(match(v, uniqv)))]
                   + }	

                 > getmode(v)
                   [1] 200
                 > getmode(v1)
				   [1] 305	

				c. What could be one additional variable that was not mentioned in the narrative that could be
 				   influencing the point distributions between the two sections?
				   
				   Gender varibale is missing , which can influence the distribution.
				    
2) We interact with a few datasets in this course, one you are already familiar with, the 2014 American Community Survey and the 
   second is a Housing dataset, that provides real estate transactions recorded from 1964 to 2016.  For this exercise, you need 
   to start practicing some data transformation steps – which will carry into next week, as you learn some additional methods.  
   For this week, using either dataset (or one of your own – although I will let you know ahead of time that the Housing dataset 
   is used for a later assignment, so not a bad idea for you to get more comfortable with now!), perform the following data
   transformations:

    a) Use the apply function on a variable in your dataset
	
	  took Housing data set for R functions

		> library("readxl")
		> 
		> housing_data <- read_excel("week-7-housing.xlsx")		

		> apply(X=housing_data[c(2)], MARGIN=2 , FUN=sum, n.rm = TRUE)
		  Sale Price 
		  8500391150 	
    b) Use the aggregate function on a variable in your dataset

        > aggregate(housing_data$"Sale Price", list(housing_data$"Sale Date"), FUN=sum)	
	  
	c) Use the plyr function on a variable in your dataset – more specifically, I want to see you split some data, perform a modification to the data, and then bring it back together
	
	   > hs_500 <- slice(housing_data, 1:500)
       > hs_500		

       > hs_500[1,2] <- 1000
	   > hs_500	  

       > hs_rest <- slice(housing_data, 501:12865)	
	   > bind_rows(hs_200603, hs_rest)
	   
	 d) Check distributions of the data
	 
	   > plot(housing_data$`Sale Date`,housing_data$`Sale Price`,type = "l", xlab = 'Sale Date', ylab ="Amount") 

     e) Identify if there are any outliers 

        using summary we can find the ouliners

        summary(housing_data)
     f)  add at least two columns
	    > housing_data <- cbind(housing_data,"City")
	    > housing_data <- cbind(housing_data,"ZIP")
        > summary(housing_data)
	 
       	   
			   
			    