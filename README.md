# ABAP: Delivery Costs Estimation App
This App has been created for educational purposes. All code is valid for ABAP Cloud (BTP ABAP Environment Trial).

The business scenario is as follows: a trading company (TC) has some booked items that are stored in the company's warehouse. The TC company should deliver these items from the warehouse to their clients. For this purpose, the TC company has a contract with a delivery company (DC). The DC delivery company provides for their clients with 4 delivery zones, based on distance in km. Every delivery zone has its rate per 1 km. 

We have to find delivery costs from the warehouse to the client for every item (order). 

To solve this task,  we should:
1. Based on the client delivery address, determine geo coordinates - longitude and latitude.
2. Based on geo data (lon and lat ) of the client and the warehouse we can build a delivery route and determine delivery distance and time.
3. Then we should determine the delivery zone and rate.
4. In the end, we can multiply the delivery distance and rate and get a delivery cost for the item.


To solve points 1 and 2 of the task, we can use the geo data app www.geoapify.com. You have to register here and get a FREE API KEY.
This service helps us to obtain a full client address with geo-coordinates (longitude and latitude) and build an optimal delivery route based on real geo data (city traffic, road rules, driving mode, and other parameters.). This service is similar to Google Maps, but from my point of view, it is cheaper and more suitable.


To validate results (geo data, distance, and delivery routes) I use data (name and address) of 22 public schools in Belostok city (Poland), due to I live in this city and I cant estimate the precision of this data.

## How it looks.

![Initial List Report](https://github.com/analiteg/ABAP-Delivery-Costs-Estimation/blob/main/img/1%20-%20Initial%20List%20Report.png)

![Initial Object Page](https://github.com/analiteg/ABAP-Delivery-Costs-Estimation/blob/main/img/2%20-%20Initial%20Object%20Page.png)

![Filled List Report](https://github.com/analiteg/ABAP-Delivery-Costs-Estimation/blob/main/img/3%20-%20Filled%20List%20Report.png)

![Filled Object Page](https://github.com/analiteg/ABAP-Delivery-Costs-Estimation/blob/main/img/4%20-%20Filled%20Object%20Page.png)



## How it works.

The model consists of 3 tables:
- ZARATES stores information about delivery zones and rates (zones, max, and min distance, rates for zone)
- ZAWAREHOUSE2 stores information about warehouse(warehouse coordinates and id)
- ZAORDER2 stores information about delivery orders (client name, address, coordinates, delivery distance, zone, time, costs, etc.).

Class ZCL_DELIVERY_COSTS_DATA generates initial demo data and saves it into DB tables. Press F9 to get all the necessary data.

Class ZCL_DELIVERY_COSTS gets necessary data via API, makes calculations, and saves results into db tables. Press F9 to run this class.

Important! Before using this class, you have to register your FREE API key at www.geoapify.com and put in the local class at line 68.

## ABAP RAP Application

To build ABAP RAP application please use CDS views from the package.
