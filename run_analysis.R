# Step 1: Creating merged and appended output table ------------------------------------------------------------

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
dfFeat  <- read.table(fnFeatures, header = FALSE, colClasses="character")
colnames <- gsub("()-","_",dfFeat[,2], fixed = TRUE)
colnames <- gsub("()","", colnames, fixed = TRUE)
colnames <- gsub("-","_", colnames)
colnames <- toupper(colnames)

# Selecting only the relevant columns
cols    <- grep("(-std\\(\\)|-mean\\(\\))", dfFeat[,2])

# Reading data tables with descriptive column names and with only the relevant columns
dfTest  <- read.table(fnTest_Data, header = FALSE, col.names = colnames)[,cols]
dfTrain <- read.table(fnTrain_Data, header = FALSE, col.names = colnames)[,cols]

#names(dfTest)  <- colnames
#names(dfTrain) <- colnames

# Reading subject and activity data
dfTestS  <- read.table(fnTest_Subject, header = FALSE, col.names="SUBJECT")
dfTrainS <- read.table(fnTrain_Subject, header = FALSE, col.names="SUBJECT")
dfTestO  <- read.table(fnTest_Output, header = FALSE, col.names="ACTIVITY")
dfTrainO <- read.table(fnTrain_Output, header = FALSE, col.names="ACTIVITY")

#dfTest  <- dfTest[,cols]
#dfTrain <- dfTrain[,cols]

# Labeling the data set with descriptive activity names
dfAct <- read.table(fnActivities, header = FALSE, colClasses="character")
dfTestO$ACTIVITY <- factor(dfTestO$ACTIVITY, levels = dfAct$V1, labels = dfAct$V2)
dfTrainO$ACTIVITY <- factor(dfTrainO$ACTIVITY, levels = dfAct$V1, labels = dfAct$V2)

# Merging and appending tables
dfTemp1 <- cbind(rep("TEST", dim(dfTest)[1]), dfTestS, dfTest, dfTestO)
names(dfTemp1)[1] <- "SUBSET"

dfTemp2 <- cbind(rep("TRAIN", dim(dfTrain)[1]), dfTrainS, dfTrain, dfTrainO)
names(dfTemp2)[1] <- "SUBSET"

dfComplete <- rbind(dfTemp1, dfTemp2)
#remove('dfTemp1','dfTemp2','dfTest','dfTrain','dfTestS','dfTestO','dfTrainS','dfTrainO', 'dfFeat', 'dfAct)

# Using descriptive activity labels
dfAct <- read.table(fnActivities, header = FALSE)
dfOutput <- merge(dfOutputT, dfAct, by.x="ID", by.y="V1", all=FALSE)
names(dfOutput) <- append(names(dfOutputT), "Activity")

cols <- append((1:(dim(dfOutput)[2]-2)), dim(dfOutput)[2]) # Selecting all the columns, but the ID column
dfOutput <- dfOutput[,cols] # Removing the ID column                          













