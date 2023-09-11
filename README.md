# PROJECT-DVD-Rental-SQL-Data-Analysis 
![Screenshot 2023-09-11 165016](https://github.com/danielmakcy/DVD-Rental/assets/144144899/28997149-b639-4069-aa4e-18f538e1096d)

In this SQL Data Analysis project, an exploratory data analysis was performed on the DVD Rental Data available on PostgreSQL.   The project is to demonstrates the usefulness of SQL in data analysis and decision-making. 

There are 15 tables in the DVD Rental database:

  * actor – stores actors data including first name and last name.
  * film – stores film data such as title, release year, length, rating, etc.
  * film_actor – stores the relationships between films and actors.
  * category – stores film’s categories data.
  * film_category- stores the relationships between films and categories.
  * store – contains the store data including manager staff and address.
  * inventory – stores inventory data.
  * rental – stores rental data.
  * payment – stores customer’s payments.
  * staff – stores staff data.
  * customer – stores customer data.
  * address – stores address data for staff and customers
  * city – stores city names.
  * country – stores country names.


The main aim of the project is to tackle and uncover insigit into the following:

  * Query 1 - Performance - Revenue by Region
  * Query 2 - Popularity - Category of the film that are more popular
  * Query 3 - Rental Behaviour - Rental Period, Return Early / Late / On-time
  * Query 4 - Promotion - Customer with lower than average rental in the past period


Key Insights and Findings

The analysis yields valuable and actionable insights for decision-making. 

1. Saint-Denis, Cape Coral and Santa Brbara dOeste are the TOP 3 cities that generate the highest revenue.
2. Film with category in Action, Animation and Children are the most popular one, in term of rental frequency.
3. Customer tends to overdue more frequently if the rental period is short (say 3 days).   The overdue percentage is much lower if the rental period is longer (say 6 or 7 days).
4. Customers with lower than average rental revenue are shortlisted.  Opportunity is available to run promotion amoung this group of customer to improve revenue.

With these insights, businesses can make informed decisions, optimize their operations, and drive growth and success.

Detailed result can be found in the RESULT folder.


Original dataset on PostgreSQL : https://www.postgresqltutorial.com/postgresql-getting-started/postgresql-sample-database/
