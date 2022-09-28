# Module-7-Challenge: Credit Card Fraud
Fraud is prevalent these days, whether you are a small taco shop or a large international business. While there are emerging technologies that employ machine learning and artificial intelligence to detect fraud, many instances of fraud detection still require strong data analytics to find abnormal charges.

In this project, historical credit card transactions and consumption patterns are assessed in order to identify possible fraudulent transactions. This is completed in three main tasks:

1. Data Modeling: Defining a database model to store the credit card transactions data and creating a new PostgreSQL database using the model. (files: QuickDBD-IMAGE)
2. Data Engineering: Creating a database schema on PostgreSQL and populating the database from the CSV files provided. (files:SQL_QuickDBD-SCHEMA, folder:DATA)
3. Data Analysis: Analyzing the data to identify possible fraudulent transactions trends data, and developing a report of the observations.(files: SQL_QUERIES, query graphs, visual_data_analysis, Report)

Extra:<br>
Another approach to identifying fraudulent transactions is to look for outliers in the data. Standard deviation or quartiles are often used to detect outliers. Two Python functions (file: challenge) are also included:
* One that uses standard deviation to identify anomalies for any cardholder.
* Another that uses interquartile range to identify anomalies for any cardholder.

![](https://assets.ncr.com/content/ncr/us/en/home/blogs/payments/credit-card-fraud-detection/_jcr_content/root/container/container_238116401_/container_1439208595/container_copy/container_copy_copy/image_1179286073.coreimg.90.1000.jpeg/1663230696569/payments-credit-card-fraud-detection-03-05-21.jpeg)
