# Code Book

This code book describes the variables, data, and transformations performed to clean and analyze the "Human Activity Recognition Using Smartphones" dataset.

## Data Source

- Original dataset: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- The dataset contains accelerometer and gyroscope data collected from the Samsung Galaxy S smartphone.

## Variables

### Raw Data

1. **subject**: Identifier of the subject who carried out the experiment (ranges from 1 to 30).
2. **activityId**: Identifier of the activity performed (from 1 to 6).
3. **features**: Measurement variables including time and frequency domain signals from accelerometer and gyroscope.

### Cleaned Data

1. **subject**: Identifier of the subject who carried out the experiment.
2. **activity**: Descriptive name of the activity performed.
3. **TimeBodyAccMeanX**: Mean of the time-domain body acceleration signal along the X-axis.
4. **TimeBodyAccMeanY**: Mean of the time-domain body acceleration signal along the Y-axis.
5. **TimeBodyAccMeanZ**: Mean of the time-domain body acceleration signal along the Z-axis.
6. **TimeBodyAccStdX**: Standard deviation of the time-domain body acceleration signal along the X-axis.
7. **TimeBodyAccStdY**: Standard deviation of the time-domain body acceleration signal along the Y-axis.
8. **TimeBodyAccStdZ**: Standard deviation of the time-domain body acceleration signal along the Z-axis.
9. **...**: Additional variables follow the same naming convention, indicating the mean and standard deviation of measurements.

## Transformations

1. **Merging Datasets**: Combined the training and test datasets.
2. **Extracting Measurements**: Extracted only the measurements on the mean and standard deviation for each measurement using regular expressions to match feature names.
3. **Descriptive Activity Names**: Merged the dataset with activity labels to include descriptive activity names.
4. **Labeling Variables**: Renamed variables to be more descriptive:
   - Replaced prefixes `t` and `f` with `Time` and `Frequency`.
   - Expanded abbreviations (`Acc` to `Accelerometer`, `Gyro` to `Gyroscope`, `Mag` to `Magnitude`).
   - Removed parentheses and hyphens for clarity.
5. **Creating Tidy Data**: Created a second tidy dataset with the average of each variable for each activity and each subject.

## Units

- All measurements are normalized and bounded within [-1, 1].
- Units are consistent across all features as they are derived from the same sensors and preprocessing.

## Summary of Calculated Variables

The tidy dataset includes the average of each variable (mean and standard deviation) for each activity and each subject. For example:
- **TimeBodyAccMeanX**: Average of time-domain body acceleration mean along the X-axis for each activity and subject.
- **TimeBodyAccStdY**: Average of time-domain body acceleration standard deviation along the Y-axis for each activity and subject.