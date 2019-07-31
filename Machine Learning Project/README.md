This project is intended to model and predict public health codes violations within the jurisdiction of Beijing Municipality, 
sponsored by the Municipal Government of Beijing and conducted under the supervisation of Prof. Ling Peng of Institute of 
Remote Sensing and Digital Earth, Chinese Academy of Sciences.

We use data from the past 4 years (2015-2018) to train machine learning using models such as Long-Short Term 
Memory (LSTM) and Auto Regression Moving Average (ARMA). Each method involves reading and processing data, building model, 
predicting with model, and error analysis. 

=========================================IMPORTANT=====================================
Python libraries required for LSTM:    
tensorflow, pandas, numpy, csv (for producing output file), random, os, matplotlib, sklearn

Python libraries required for ARMA:    
pandas, numpy, scipy, tushare, datetime, statsmodels, matplotlib, sklearn
=========================================IMPORTANT=====================================
The data files used here contain information on the monthly cases of code violations in various locations throughout Beijing 
for the past 4 years. Different files refer to different types of violations. 

Both methods can be applied to data files 1)of the Excel or csv format 2)have the 3rd column as months 3) have the 4th column 
as number of cases 4)have the number of cases of 48 months (4 years) for each site. Once these conditions are satisfied, the 
program codes will function on files with arbitrary numbers of sites. 

The output of both methods includes graphs of case numbers by month, comparison of predicted data and real data by site, and MSE/MAE
error anaylises. LSTM model will produce accuracy vs. number of epoches on top of that, plus a .csv file of predicted data and 
real data by site and time. ARMA model outputs  graphs of autocorrelation and partial correlation to verify the stability of 
input data. 

======================ACKNOWLEDGEMENTS AND COPYRIGHT INFORMATION========================
All data files are properties of the Municipal Government of Beijing. Please do not share without written permission obtained
from relevant agencies. The creation of the LSTM coding file is accredited to Dr. Xiang Li of Institute of Remote Sensing 
and Digital Earth, Chinese Academy of Sciences. The subsequent editing and the creation of ARMA file are jointly accomplished by
myself, Muhe Li of University of California, Davis, and Yijie Chen of Beijing University of Technology. 

****************************************************************************************  
edited July 31, 2019
