-- Question 1: How can you isolate (or group) the transactions of each cardholder?
-- Count the transactions that are less than $2.00 per cardholder.
-- Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.
create view small_transactions as
select v.cardholder_id,count(v.cardholder_id)
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v
where v.amount<2
group by v.cardholder_id
order by count desc
--ANSWER:
--Yes. The crieterion for the query avove, as many as 5 cardholders exhibit over 20 transactions 
--for less than 2 dollars (IDs: 12, 19, 24, 11, 10). The time between those will have to checked for confirmation.
select*from small_transactions


--Take your investigation a step further by considering the time period in which potentially fraudulent 
--transactions are made. 
-- Question 2: What are the top 100 highest transactions made between 7:00 am and 9:00 am?
create view top_100_between_7_and_9 as
select cast (v.date::timestamp as time),v.amount,v.cardholder_id
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v
where v.date::time >= to_timestamp('00-00-0000 07:00:00','dd-mm-yyyy hh24:mi:ss')::time and v.date::time <= to_timestamp('00-00-0000 09:00:00','dd-mm-yyyy hh24:mi:ss')::time
order by v.amount desc
limit 100
--ANSWER:
--The query above collects the 100 most expensive transactions made between 7 am and 9 am based on the transaction tamestamps.
select * from top_100_between_7_and_9


--Question 3: Do you see any anomalous transactions that could be fraudulent?
create view possibly_fraudulent_transactions as
select sum(v.amount),v.cardholder_id
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v
where v.date::time >= to_timestamp('00-00-0000 07:00:00','dd-mm-yyyy hh24:mi:ss')::time and v.date::time <= to_timestamp('00-00-0000 09:00:00','dd-mm-yyyy hh24:mi:ss')::time
group by (v.cardholder_id)
order by sum(v.amount) desc
limit 100
--ANSWER:
--Based on the two queries above, cardholders 1, 16, 25, and 9 have expended over 1000 dollars in transaction made 
-- between 7 am and 9 am. Out of the four cardholders, three also exhibited high number of purchaces of less than 2 dollars: 
-- ID_1 had 10 purchases of less than 2 dollars,
-- ID_16 had 19 purchases of less than 2 dollars,
-- ID_25 had 16 purchases of less than 2 dollars
-- Therefore, the three highest transactions observed for IDs 1, 16, and 25 are suspicious.
select * from possibly_fraudulent_transactions


--Question 4: Is there a higher number of fraudulent transactions made during this time frame versus the rest of the day?

--Query 1: General Transaction amount vs. time of day
create view query_1 as
select cast (v.date::timestamp as time),v.amount,v.cardholder_id
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v
order by v.date::time

--Query 2: General Transaction count vs. truncated hour of day (1-24)
create view query_2 as
select count(k.date)
from(
select cast (v.date::timestamp as time),v.amount,v.cardholder_id
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v)
as k
group by date_trunc ('hour',k.date)
order by date_trunc ('hour',k.date) asc

--Query 3: Sum of Transaction amount vs. truncated hour of day (1-24)
create view query_3 as
select sum(k.amount)
from(
select cast (v.date::timestamp as time),v.amount,v.cardholder_id
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v)
as k
group by date_trunc ('hour',k.date)
order by date_trunc ('hour',k.date) asc

--Query 4:Transaction amount vs time for specific carholders
create view query_4 as
select cast (v.date::timestamp as time),v.amount,v.cardholder_id
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v
where v.cardholder_id = 4
order by v.date::time

--ANSWER:
-- The queries above do not show any particularities in the number or total amount of transactions made between the 
-- hours of 7 am and 9 am. Queries 1 through 3 exhibit similar patterns, with total amounts and counts peaking at 02:00, 
-- 07:00, and 16:00. Furthermore, by using Query 4 for individual cardholders, it is also observed that the highest transactions
-- are performed at around 02:00, 07:00, and 16:00.
select * from query_1
select * from query_2
select * from query_3
select * from query_4


--Question 5: What are the top 5 merchants prone to being hacked using small transactions?
create view top_5_risky_merchants as
select v.id_merchant,count(v.cardholder_id)
from(
select * from "Credit_Card"
left join "Transaction" on "Transaction".card = "Credit_Card".card) as v
where v.amount<2
group by v.id_merchant
order by count desc
limit 5

--ANSWER:
-- From the query above, merchants ID: 141, 145, 48, 149, and 114 are the most prone due to the higher 
-- count of small transactions.
select * from top_5_risky_merchants


