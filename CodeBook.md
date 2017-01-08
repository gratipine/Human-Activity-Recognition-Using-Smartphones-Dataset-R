#Human Activity Recognition Using Smartphones Tidy Dataset#
##Version 1.0
##CodeBook.md

This is the description of the transformations ran on the data in the assignment and the properties of the tidy data extracted.

###Variables of the tidy data:
  - columns:
    - Activities
    - Subject
    - Mean
    - StandardDeviation

The dataset contains the means and the standard deviations of the measurements in the X training and test data sets, gouped by Activity and Subject.
    
###Process of deriving the transformational script:

1.Create a script

2.Put in the same folder as the script the untidy pieces of data: 
  - "X_test.txt"
  - "X_train.txt"
  - "y_test.txt"
  - "y_train.txt"
  - "subject_test.txt"
  - "subject_train.txt"
  - "activity_labels.txt" - for ease of reference when constructing the script

3.The script loads the first 6 pieces of data from step two.

4.Each piece of data is stuck together with the same type of data in data frames : X with X, y with y, subject with subject. This is done with test being the first one for correct combining of all the data later on.

5.A data frame is created out of the X measurements which holds only the means and the standard deviations of each row. This keeps the old order of measurements.

6.New, more descriptive names are given to the activities. The numbers 1 through 6 used for identification of activities are replaced by labels "Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying", which make it easier to understand what the measurements represent. The labels are taken from the given data set. 

7. Proper names are put to the columns in the dataset - "Means" and "Standart_Deviations", where previously the columns would have had to be accessed by index and their contents were unlabeled.

8.The activities and the subjects data frames are joined to the data frame containing the means and standard deviations. The order is preserved, so this poses no problem.

9.A cross tabs data frame is created using plyr, which contains as a first column Activities, as second Subject and then third and fourth are means and standard deviations. 

10. The data frame from step 9 is written into a file in the same folder as the script.


###Steps required from the user of the script to derive the same result:

1. Put raw files from point 2 from the last part in the same folder as the script. 

2. Set working directory to the script location

3. Run script.