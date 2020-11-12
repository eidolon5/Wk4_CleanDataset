Title: README file associated with Human Activity Recognition (HAR) Using Smartphones Dataset Summarization
Author: S. Vacik

The R script "run_analysis.R" loaded the data from six files specified in the CodeBook and assembled the datasets into two dataframes (testdf and traindf). The script loads the activity labels (from "activity_lables.txt") into the dataframe "actlabels".  The script merged the two dataframes into a single dataframe, HARdf, and extracted the subject numbers, activity labels, and triaxial means and standard deviations (std) per subject and per activity. The following column names were assigned: "SubjectID", "Activity", "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z","tBodyAcc-std()-X", "tBodyAcc-std()-Y",
and "tBodyAcc-std()-Z".

The numeric activity labels were replaced with the corresponding character terms ("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", and "LAYING"). The "SUBJECTID" column was changed to numeric type and ordered in descending order from 1 to 30. 

The script created an empty dataset ("HARsummary") of 180 rows and 8 columns and assigns the same column names as HARdf. The script extracted unique subject identifiers into a vector "subjectIDs". 

The script used two nested for loops with two rule-constrained indeces "id" and "act" for the variables "SubjectID" and "Activity". The index "act" incremented by 1 after the means and std per subject and activity are averaged. The index "id" incremented by 1 after averages per each mean and std are obtained per activity for a single subject id. The first for loop index "i" iterates through the rows of HARsummary (dataframe) and the second for loop index "j" iterated over the columns 3 through 8 ("tBodyAcc-mean()-X" through "tBodyAcc-std()-Z") of both HARdf and HARsummary.

Within the first for loop, the script set the logic used to subset the data to be averaged in the second for lood and saved it to "subsetlogic". The script set the variable "subsetlogic" as the slice of HARdf for which the variable "SubjectID" equals the "subjectIDs" at index "id"" and the variable "Activity" equals the "actlabels" at index "act". In the second of the nested for loops, the script extracts the slice of HARdf by subsetlogic and for the j-th column. The mean is taken over the extracted column vector and rounded to 6 decimal places. The result is stored in the cell [i,j] of the HARsummary dataframe.

After completion of the nested for loops, the script saved the HARsummary dataframe to the working directory with filename "HARdataset.txt" using the write.table function and variable row.names set equal to FALSE.

