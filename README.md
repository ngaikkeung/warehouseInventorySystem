# Light version Warehouse Inventory System

This project is a java spring boot web application.

## Screenshot of application

#### Dashboard page
![image](https://github.com/ngaikkeung/warehouseInventorySystem/blob/master/screenshot/dashboard.png)

#### Update page
![image](https://github.com/ngaikkeung/warehouseInventorySystem/blob/master/screenshot/update.png)

#### Transfer page
![image](https://github.com/ngaikkeung/warehouseInventorySystem/blob/master/screenshot/transfer.png)

#### Search page
![image](https://github.com/ngaikkeung/warehouseInventorySystem/blob/master/screenshot/search.png)

## Installation

### Prerequisites

1. Require Java SDK 8, [Maven](https://maven.apache.org/download.cgi) and [MySQL](https://www.mysql.com/downloads/)

2. Create a persistent database and database user:
```sql
mysql> create database warehouse; -- Creates the new database
mysql> create user 'warehouse_user'@'%' identified by 'password'; -- Creates the user
mysql> grant all on warehouse.* to 'warehouse_user'@'%'; -- Gives all privileges to the new user on the newly created database
```

### Clone repository
Clone the git repository using git:

```bash
git clone https://github.com/ngaikkeung/warehouseInventorySystem
cd warehouseInventorySystem
```

### Install dependencies

```bash
./mvnw clean package
```

### Run web application

```bash
java -jar target/wis-0.0.1-SNAPSHOT.jar
```

### Open browser

```bash
http://localhost:8080/
```

### Upload testing dataset 

Click on `Update product and inventory` page,
and upload the csv file from dataset folder.


## Daily task

#### Day 1

- Study the coding task requirements.
- Study the structure of java spring boot.
- Study the concept of java spring MVC.
- Study the implement of java spring boot application.

### Day 2

- Design and develop a database and object entity.
- Design and develop the UI of web application.
- Design and develop the routing of web application.
- Design and develop the implement logic of read csv file and store to database.
- Debug.


### Day 3

- Testing the functionality of web application.
- Debug.
- Build an executable JAR
- Finished the `README.md` file.




