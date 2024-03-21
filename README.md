# Database for EuroTrainLines

## About

Designed and implemented relational database for fictional european high speed rail company.

EuroTrainLines is a high speed rail company based in Vienna, Austria offering several routes to both domestic and international destinations. EuroTrainLines has a rolling stock of high speed trains sourced from the world’s top train manufacturers, such as Alstom, Bombardier and more. Popular routes, like Vienna to Prague, offer multiple daily departures. Eurolines is creating a database to track passenger, train, ticket and sales transaction information.

The database has the following requirements:
- The database will keep track of passengers, routes, schedules and fares, trains,
conductors, tickets, and ticket sales transactions
- For each passenger, we will keep track of first name, last name, and email
- For each ticket, we will keep track of the unique ticket ID, passenger, and travel
information
- For train service, we will keep track of route, schedule and fare information
- For each train, will also keep track of information regarding the train itself, such as train
manufacturer, train type and conductor
- For sales transaction, we will track the unique sale transaction id, customer and the
transaction date
- A time table will track scheduled service for each day. A time table can have many
schedules for each day of the calendar year.

Assumptions:
- Fare is based on the unique route (i.e. Vienna to route) and is not differentiated by
passenger class or travel time and date. However, in the future, euroline plans to extend
this feature to dynamically set prices based on time, date and passenger class
- The inbound and outbound conductor for a given route (e.g. round trip to Vienna and
Salzburg) is unique for each leg
- Customers and passengers do not have to be the same individual. In other words, a
customer can buy a ticket on behalf of another person.
