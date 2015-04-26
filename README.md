
Executing the R script "run_analysis.R" will accomplish the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script is annotated, but works as follows:
1. Reads in the file containing test data ("X_test.txt").  For the script to work, this file must be in your working directory.
2. Reads in the file "features.txt", which has the identity of each column included in the test data file.
3. Uses the "features.txt" file to assign descriptive names to each column of the test data file.  
4. Reads in the data file containing the activities associated with each row of the test data file.
5. Adds the activities as a column to the test data file.  The activities column is a factor, with 6 possible levels.
6. Reads in the data file containing the identity of each subject.
7. Adds the subjects as a column to the test data file.  
8. Steps 1-7 are then repeated for the training data (X_train.txt").
9. Joins the training and test data into a single file.
10. Creates valid column names (column names in the original files contain invalid characters) that can be selected in the package "dplyr".
11. Extracts only those variables describing mean or standard deviation of a measurement.
12. Calculates means by activity and by subject and places these means into a new data frame.  
13. Finally, writes the data frame to a text file.  

The following files must be in your working directory:
X_train.txt
y_train.txt
subject_train.txt
X_test.txt
y_test.txt
features.txt
subject_text.txt

