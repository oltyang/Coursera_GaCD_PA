# Step 1: Creating merged and appended output table -------------------------------------------------------

# Input check: checking the existence of the data
fnTest_Data    <- file.path("UCI HAR Dataset","test","X_test.txt")
fnTest_Subject <- file.path("UCI HAR Dataset","test","subject_test.txt")
fnTest_Output  <- file.path("UCI HAR Dataset","test","y_test.txt")

fnTrain_Data    <- file.path("UCI HAR Dataset","train","X_train.txt")
fnTrain_Subject <- file.path("UCI HAR Dataset","train","subject_train.txt")
fnTrain_Output  <- file.path("UCI HAR Dataset","train","y_train.txt")

fnFeatures   <- file.path("UCI HAR Dataset","features.txt")
fnActivities <- file.path("UCI HAR Dataset","activity_labels.txt")

lFiles <- c(fnTest_Data, fnTest_Subject, fnTest_Output, 
            fnTrain_Data, fnTrain_Subject, fnTrain_Output, 
            fnFeatures, fnActivities)                            # Files to be checked

sMessage <- vector()                                             # Message vector initilaization
for (fn in lFiles) {
  if (!file.exists(fn)) {                                        # Checking the existence of the files
    sError   <- paste("The <",fn,"> file is missing!", sep = "") # Error message construction
    sMessage <- paste(sMessage, sError, sep="\n")                # Concatenating the error message  
  }
}
if (length(sMessage) > 0) {                                      # If there were errors, then print them
  stop(sMessage)
}

# Constructing descriptive column names
dfFeat  <- read.table(fnFeatures, header = FALSE, 
                      colClasses="character")
colnames <- gsub("()-","_",dfFeat[,2], fixed = TRUE)             # Formatting the variable names
colnames <- gsub("()","", colnames, fixed = TRUE)
colnames <- gsub("-","_", colnames)
colnames <- gsub("BodyBody","Body", colnames)
colnames <- toupper(colnames)                                    # To uppercase conversion 

# Selecting only the relevant columns
cols    <- grep("(-std\\(\\)|-mean\\(\\))", dfFeat[,2])

# Reading data tables with descriptive column names and with only the relevant columns
dfTest  <- read.table(fnTest_Data, header = FALSE, col.names = colnames)[,cols]
dfTrain <- read.table(fnTrain_Data, header = FALSE, col.names = colnames)[,cols]

# Reading subject and activity data
dfTestS  <- read.table(fnTest_Subject, header = FALSE, col.names="SUBJECT")
dfTrainS <- read.table(fnTrain_Subject, header = FALSE, col.names="SUBJECT")
dfTestO  <- read.table(fnTest_Output, header = FALSE, col.names="ACTIVITY")
dfTrainO <- read.table(fnTrain_Output, header = FALSE, col.names="ACTIVITY")

# Labeling the data set with descriptive activity names
dfAct <- read.table(fnActivities, header = FALSE, colClasses="character")
dfTestO$ACTIVITY <- factor(dfTestO$ACTIVITY, levels = dfAct$V1, labels = dfAct$V2)
dfTrainO$ACTIVITY <- factor(dfTrainO$ACTIVITY, levels = dfAct$V1, labels = dfAct$V2)

# Merging and appending tables
dfTemp1 <- cbind(rep("TEST", dim(dfTest)[1]), dfTestS, dfTest, dfTestO)
names(dfTemp1)[1] <- "SUBSET"

dfTemp2 <- cbind(rep("TRAIN", dim(dfTrain)[1]), dfTrainS, dfTrain, dfTrainO)
names(dfTemp2)[1] <- "SUBSET"

dfComplete <- rbind(dfTemp1, dfTemp2)                            # Appended Output

# Removing unnecessary variables
remove('dfTemp1','dfTemp2','dfTest','dfTrain','dfTestS','dfTestO','dfTrainS','dfTrainO', 'dfFeat', 'dfAct',
       'colnames', 'cols', 'fn', 'lFiles', 'sMessage', 'fnActivities', 'fnFeatures', 'fnTest_Data', 
       'fnTest_Output', 'fnTest_Subject', 'fnTrain_Data', 'fnTrain_Output', 'fnTrain_Subject')

# Writing the output 
write.table(dfComplete, "all_clean_data.txt")

# Step 2: Creating independent, tidy data with averages --------------------------------------------------

library(reshape2)
dfTemp   <- dfComplete[,2:length(names(dfComplete))]             # Removing the SUBSET variable
dfMelted <- melt(dfTemp, id.vars=c("SUBJECT","ACTIVITY"))        # Creating molten data frame

dfTidy   <- dcast(dfMelted, 
                  formula = ACTIVITY + SUBJECT ~ variable, mean) # Casting back with the calculation

# Removing unnecessary variables
remove('dfTemp','dfMelted')
       
# Writing the output 
write.table(dfTidy, "averages_by_activity_subject.txt")
