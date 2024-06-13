# Human Activity Recognition Using Smartphones

This repository contains the R scripts and documentation for analyzing the "Human Activity Recognition Using Smartphones" dataset.

## Project Description

The goal of this project is to create a tidy dataset from the raw data provided, which includes accelerometer and gyroscope readings from a Samsung Galaxy S smartphone. The tidy dataset contains the average of each measurement for each activity and each subject.

## Files

- **run_analysis.R**: R script that performs the data cleaning and analysis.
- **tidy_data.txt**: Output file containing the tidy dataset.
- **CodeBook.md**: Code book describing the variables, data, and transformations performed.
- **README.md**: This file, providing an overview of the project and instructions.

## Analysis Steps

1. **Loading Libraries**: Necessary libraries such as `dplyr` and `tidyr` are loaded.
2. **Loading Data**: The raw data files are read into R.
3. **Merging Datasets**: Training and test datasets are merged to create a single dataset.
4. **Extracting Measurements**: Only measurements on the mean and standard deviation for each measurement are extracted.
5. **Descriptive Activity Names**: Activities are labeled with descriptive names using a lookup table.
6. **Labeling Variables**: The dataset variables are labeled with descriptive names.
7. **Creating Tidy Data**: A second tidy dataset is created with the average of each variable for each activity and each subject.
8. **Writing Output**: The tidy dataset is written to `tidy_data.txt`.

## How to Run the Script

1. Clone this repository.
2. Ensure the raw data files are in the working directory.
3. Run the `run_analysis.R` script:
```{r}
source("run_analysis.R")
```

