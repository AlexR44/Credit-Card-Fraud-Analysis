# CREDIT CARD FRAUD ANALYSIS REPORT
## Executive Summary
The study presented herein assesses the vulnerability to hacking of the firm's credit cardholders, and the possibility of timeframes for higher fraudulent activity on the customers' credit cards. 

Additionally, the individual concers of valuable customers (ID 2, 18, and 25) are addressed by individually investigating the transaction histories and identifying potetially fraudulent transactions.

## General Assessment
In an effort to help analyze potential fraudulent transactions, a series of database queries were generated  to discover the information needed.

Understanding that fraudsters typically hack a credit card by making several small transactions (generally less than $2.00) that are typically ignored by cardholders, the number of transactions for less than $2.00 per cardholder was assessed to determine the cardholder IDs most vulnerable to this type of hacking. Based on this crieterion, as many as 5 cardholders exhibit higher vulnerability to this type of hacking by showing over 20 transactions for less than 2 dollars, namely Cardholde IDs 12, 19, 24, 11, 10) -- See figure below. <br>

![](/IMAGES/Less%20Than%202%20Dollar%20Count.png)<br><br>


An initial consideration was given to a time period between 7:00 am and 9:00 am in which potentially fraudulent transactions could be made. As shown below, the majority of the highest 100 transaction are for small amounts, but a top transactions made were for amounts greater than $1000/. This may be indicative of fraudulent behavior, but the transactions for other times of the day will have to be assessed to further confirm this hypothesis.<br>

![](/IMAGES/Between%207%20and%209%20am.png)<br><br>

By expanding the view to include the 24 hours of the day, the scatter plot below shows that there is no identifiable pattern between transaction amounts and the time of day, thus disproving the idea discussed above.<br>

![](/IMAGES/Transaction%20Amount%20vs%20Time%20of%20day.png)<br><br>

Furthermore, the total number of transactions within each hour of the day, as shown in the figure below, do not suggest that the timeframe between 7 am and 9 am is particularly active for credit card fraud, as the number of transactions appear to peak at 03:00, 07:00, and 18:00.

![](/IMAGES/Transaction%20count%20vs.%20time%20of%20day.png)<br><br>

The above is also confimed by comparing the total transaction amount at each hour of the day (see figure below), where top transaction amounts appear to peak at 02:00, 07:00, and 16:00.

![](/IMAGES/Total%20transaction%20Amount%20vs%20Time%20of%20day.png)<br><br>

Additionally, as exemplified below for Cardholder ID 1, large amount transactions are observed without any specific periodity that wpuld indicate a time for higher fraudulent activity. 

![](/IMAGES/CH1%20Transaction%20amount%20vs%20time%20of%20day.png)<br><br>

Therefore, a general assessment conclusion can only be made with regards to the vulnerability to hacking based on small (<$2.00) transactions. Accordingly, the top 5 risky merchants based on number of such transactions is shown in the figure below.

![](/IMAGES/Top%205%20Risky%20merchants.png)<br><br>

## Assessment for Cardholders 2 and 18
To evaluate the concern that the firm's two most valuable customers have been hacked, a thorough assessment of their transaction history was performed to verify if there are any fraudulent transactions. 

The figure below shows the transaction history comparison for Cardholders 2 and 18. As shown, Cardholder 18 exhibits a total of 9 transactions for much higher amounts, whereas all the transaction by Cardholder 2 are less than $20. These higher transactions from Cardholder 18 appear to be suspicious, as they are all from different merchant -- a recurring merchant would not be suspicious for such high amounts, as it would indicate recurring monthly expenses. 

![](/IMAGES/Transaction%20history%20comparison%202%20and%2018.png)<br><br>

Furthermore, as shown by the analysis below for the high amount transactions, these large transaction for Cardholder 18 happen mostly at pubs and restaurant, with the exception of the one for $1769 with Merchant Romero-Jordan # which is a food-truck. This is highly suspicious, because the transaction amount is too high for a food-truck expense.

![](/IMAGES/Top%20Transaction%20Amounts%20for%2018.png)<br><br>

## Assessment for Cardholders 25
The firm has been informed that the CEO of the firm's  biggest customer (Cardholder 25) has a suspicion that someone has used her corporate credit card without authorization in the first quarter of 2018 to pay quite expensive restaurant bills. 

To assess this concern, the transaction history from January 2018 to June 2018 for Cardholder ID 25 was evaluated for outlying transactions that would suggest unusual behavior. As shown by the monthly boxplots below, there are outliers in almost every month:
* Jan: 1 outlier for approx. $1200
* Feb: None
* Mar: 1 outlier for approx. $1300
* Apr: 3 outliers for approx. $100, $300, and $1200
* May: 1 outlier for approx. $1200
* June: 3 outliers for approx. $700, $1200, and $1800

![](/IMAGES/Monthly%20Transactions%20Boxplot%20for%2025.png)<br><br>

As further shown in the figure below, most of the large transactions (outliers) are from bars, pubs, or restaurants. However, as also observed for Cardholder 18, a food truck charge for $1046 in May may be considered an anomaly.  

![](/IMAGES/Top%20Transaction%20Merchants%20for%2025.png)<br><br>
