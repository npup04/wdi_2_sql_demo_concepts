# Database/SQL Concepts Demo

We connect to [PostgreSQL](http://en.wikipedia.org/wiki/PostgreSQL), our [object-relational database management system](http://en.wikipedia.org/wiki/Object-relational_database_management_system), using [SQL](http://en.wikipedia.org/wiki/SQL).

Some important terms for you to define as we go along:

* table
* row
* column
* query
* relation
* schema
* data type
* function
* interface
* psql

In order to do anything with PostgreSQL, we must first be running our PostgreSQL server. To do this run your `/Applications/Postgre93.app` program, and you'll see a small elephant appear in your top status bar.

We manually access PostgreSQL using the `psql` commandline client. Open your terminal and run that now. To exit from `psql` type `\quit` (including the backslash).

Before we can do much, we need to create a *database* to hold your *tables*. To do this run `createdb classroom_demo` from the bash shell - it won't return any text if it works. But now if we run `psql -d classroom_demo` it will connect to the classroom_demo database.

Alternatively, you could have run the command `CREATE DATABASE classroom_demo` from the psql shell, and then connected using `\c classroom_demo`.

Now we'll need to create a table where we'll keep students. Each student has a first_name, last_name, gpa, phone_number and birthday. We can type this manually into the *psql* terminal, but its often easier to do it in a text editor, and then copy/paste into the psql terminal.

```sql

CREATE TABLE students (
  first_name TEXT,
  last_name TEXT,
  gpa NUMERIC(3, 2),
  birthday DATE
);

```

We can see that we've created the table (and any other tables that might exist) by typing `\dt` in *psql*.

Let's create another table called `teachers`. Teachers will have first_name, last_name, birthday and yearly_salary.

```sql

CREATE TABLE teachers (
  first_name TEXT,
  last_name TEXT,
  salary MONEY,
  birthday DATE
);

```

We can also run these commands by putting them into a `.sql` file and executing them by typing `psql -f example.sql`, or in our instance here `psql -f classroom.sql`. In our `classroom.sql` file we have to create and connect to the right database.

```sql

CREATE DATABASE classroom_demo;
\c classroom_demo

CREATE TABLE students (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  gpa NUMERIC(3, 2),
  birthday DATE
);

CREATE TABLE teachers (
  id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  salary MONEY,
  birthday DATE
);

```

If you run it a second time, you may see an error like:

  psql:classroom.sql:1: ERROR:  database "classroom_demo" already exists
  You are now connected to database "classroom_demo" as user "davidfisher".
  psql:classroom.sql:9: ERROR:  relation "students" already exists
  psql:classroom.sql:16: ERROR:  relation "teachers" already exists

This is because you've already made the classroom_demo database, and the students and teachers tables. Depending on what we're doing, we *may* want to drop everything at first.

You can delete (drop) a table with `DROP TABLE table_name`. In this case `DROP TABLE students` would drop the students table and all of its contents. You can drop a database with `DROP DATABASE database_name` or in this case `DROP DATABASE classroom_demo`



### Your Turn
