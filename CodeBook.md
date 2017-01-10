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

1. Create a script

2. Download and unzip the data given for the assignment.

2. Put in the same folder as the script the untidy pieces of data: 
  - "X_test.txt"
  - "X_train.txt"
  - "y_test.txt"
  - "y_train.txt"
  - "subject_test.txt"
  - "subject_train.txt"
  - "activity_labels.txt"
  - "features.txt"

3. The script loads the data from step 2.

4. Each piece of data is stuck together with the same type of data in data frames : X with X, y with y, subject with subject. This is done with test being the first one for correct combining of all the data later on.

5. The names from "features.txt" are set as the column names for the X data frame. The Y and Subject data is attached to X as columns.

6. Only the columns with Std, Mean, Activity and Subject in the name are copied in a temporary data set, fulfilling step two of the requirements.

7. New, more descriptive names are given to the activities by assigning them the names from the activity dataset. 

8. More descriptive names are given to the columns - a single "t" becomes "time", for example.

9. A cross tabs data frame is created using plyr, which contains as a first column Activity, as second Subject and then the rest are the means of the measurements.

###Steps required from the user of the script to derive the same result:

1. Pull the project from github.

2. Set working directory to be the directory of the script.

3. Run the script.