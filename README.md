# ABAP: Delivery Costs Estimation App
This App has been created for educational purposes. All code is valid for ABAP Cloud (BTP ABAP Environment Trial).

The business scenario is as follows: a trading company (TC) has some booked items that are stored in the company's warehouse. The TC company should deliver these items from the warehouse to their clients. For this purpose, the TC company has a contract with a delivery company (DC). The DC delivery company provides for their clients with 4 delivery zones, based on distance in km. Every delivery zone has its rate per 1 km. 

We should find delivery costs from the warehouse to the client for every item (order). 

To solve this task,  we should:
Based on the client delivery address, determine geo coordinates - longitude and latitude.
Based on geo data (lon and lat ) of the client and the warehouse we can build a delivery route and determine delivery distance and time.
Then we should determine the delivery zone and rate.
In the end, we can multiply the delivery distance and rate and get a delivery cost for the item.
