# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                    levels=c('New York', 'California', 'Florida'),
                    labels=c(1,2,3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8 )
training_set = subset(dataset,split== TRUE )
test_set = subset(dataset,split== FALSE )

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Multiple Linear Regression to the Training set

# can be also written as if you want selected independent columns and . for all columns
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State, 
#               training_set)

regressor = lm(formula = Profit ~ . ,
               data = training_set)

summary(regressor)

#Analizing the result of summery coffecient we see R.D.Spend has the maximum effect as P-value is minimum and has 
# "***" statistical significance
# that gives the benefit that we can also use simple linear regression for faster process 
#like  formula = Profit ~ R.D.Spend that will be ok and will give same prediction


# Predicting the Test set results
y_pred_test = predict(regressor, newdata = test_set)
y_pred_test

###END

# now lets do test by doing  simple regression 
#as we found out profit is depend on R.D.Spend mostly from above
regressor1 = lm(formula = Profit ~ R.D.Spend ,
               data = training_set)
y_pred_test1 = predict(regressor1, newdata = test_set)

##the prediction is very close 
y_pred_test
y_pred_test1

