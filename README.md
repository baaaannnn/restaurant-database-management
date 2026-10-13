# Restaurant Database Management

Academic relational database project for managing restaurant branches, dishes, people, employees, chefs, customers, and orders.

## Database Design
The project maps an ER model into relational tables using primary keys, foreign keys, composite keys, CHECK constraints, and NOT NULL constraints. A self-referencing chef relationship records tutoring assignments. Junction tables connect branches and dishes, chefs and dishes, and orders and dishes.

## Technologies
SQL and SQLite.

## Run
```bash
sqlite3 restaurant.db < schema.sql
sqlite3 -header -column restaurant.db < queries.sql
```
Alternatively, execute schema.sql followed by queries.sql in a SQLite editor.

## Queries
The six examples demonstrate WHERE filters, GROUP BY and HAVING, nested subqueries, INNER JOIN, and LEFT JOIN. They explore chefs without tutors, popular dishes, active customers, branch menus, and order details.

## Portfolio Preparation
SQL was transcribed from the supplied academic report. The third query's table reference was corrected from Order to Orders. The final display query omits the password column. The supplied demonstration records are retained; they are not credentials for a deployed service. The ER diagram and relational schema in the original report are the design source. Course reports and student identifiers are not included in this repository.

Academic team project; this portfolio does not claim sole authorship.
