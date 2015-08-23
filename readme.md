---
title: "Tidy dataset for Human Activity Recognition Using Smartphones Dataset"
author: "Ludwik Przyrowski"
date: "Sunday, August 23, 2015"
output: html_document
---

#summary
Presented R script *run_analysis.r* is prepared to create summarizing dataset for research for Human Activity Recognition Using Smartphones prepared by Smartlab - Non Linear Complex Systems Laboratory team [1] and presented at Smartlab website. For more information about source data please read *readme.txt* file in source data directory or visit [2][2].

Script is designed to collect all data from test and train data. Both data are connected and columns are slightly renamed to be easy recognized. Number of activity actions were replaced with activity name for all rows. Presented are only columns with mean and standard deviation values. At the end average values for all mean and standard deviation columns for each subjects and activity are calculated. 

All column are described in *codebook.md* added to solution.

#instruction

Before running *run_analysis.R* please download source dataset (v.1.0) from web site [3][3].
Please unzip data and run script in the same directory.

After that *UciHar.txt* file will be generated with tidy dataset.

#License:

[1] Divide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

[2]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
[3]:https://d396qusza40orc.cloudfront.net/getdata/projectfiles/UCI HAR Dataset.zip