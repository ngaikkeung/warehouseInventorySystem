# Light version Warehouse Inventory System

This project is a java spring boot web application.

## Installation

### Prerequisites

Need Java SDK 8, [Maven](https://maven.apache.org/download.cgi) and [MySQL](https://www.mysql.com/downloads/)

Create a persistent database and database user:
```sql
mysql> create database warehouse; -- Creates the new database
mysql> create user 'warehouse_user'@'%' identified by 'password'; -- Creates the user
mysql> grant all on warehouse.* to 'warehouse_user'@'%'; -- Gives all privileges to the new user on the newly created database
```

### Clone repository
Clone the Git repository using git:

```bash
git clone https://github.com/ngaikkeung/warehouseInventorySystem
cd warehouseInventorySystem
```

### Install Dependencies

```bash
./mvnw clean package
```

### Run web application

```bash
java -jar target/wis-0.0.1-SNAPSHOT.jar
```


