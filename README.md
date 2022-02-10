# Utility Mangement System

## Git

Clone this repository
```sh
$ git clone https://github.com/iamrajbhattarai/ums.git
```
## Docker
Install [docker](https://docs.docker.com/engine/install/) and [docker-compose](https://docs.docker.com/compose/install/) in your system.

To run the project in docker

    $ docker-compose up -d			#  Will create all necessary services
    Starting db ... done
    Starting django   ... done

To stop all running containers

    $ docker-compose stop			# Will stop all running services
    Stopping db ... done
    Stopping django   ... done

## Django
Once you have created all necessary services. You may want to perform some tasks on Django server like `migrations`, `collectstatic` & `createsuperuser`.
Use these commands respectively.

    $ docker exec -it django bash		# Get a shell on container

    # python manage.py collectstatic 	# Collecting static files
    # python manage.py migrate		# Database migrate
    # python manage.py createsuperuser	# Creating a superuser for login.

Now you should be able to access your django server on http://localhost:8000 and pgadmin on http://localhost:5051/

 ## Status and Logs
 For viewing status of your docker container.

    $docker-compose ps
    
     Name                Command               State                       Ports                    
    ------------------------------------------------------------------------------------------------
    db        docker-entrypoint.sh postgres    Up      5432/tcp                                     
    django    bash -c  python manage.py  ...   Up      0.0.0.0:8000->8000/tcp,:::8000->8000/tcp     
    pgadmin   /entrypoint.sh                   Up      443/tcp, 0.0.0.0:5051->80/tcp,:::5051->80/tcp


For viewing logs of your docker services.

    $ docker-compose logs [containername]
     Apply all migrations: account, admin, auth, authtoken, contenttypes, core, sessions, sites, socialaccount, user
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0001_initial... OK
      
## Create database with all the data from dump sql file

    
    $ docker exec -it db bash
    
    bash-4.4# psql -U postgres
    psql (11.2)
    Type "help" for help.

    postgres=# \l
                                        List of databases
           Name       |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
    ------------------+----------+----------+------------+------------+-----------------------
     postgres         | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
     template0        | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                      |          |          |            |            | postgres=CTc/postgres
     template1        | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                      |          |          |            |            | postgres=CTc/postgres
     template_postgis | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
    (5 rows)

    postgres=# DROP DATABASE postgres;
    DROP DATABASE
    postgres=# \l
                                        List of databases
           Name       |  Owner   | Encoding |  Collate   |   Ctype    |   Access privileges   
    ------------------+----------+----------+------------+------------+-----------------------
     template0        | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                      |          |          |            |            | postgres=CTc/postgres
     template1        | postgres | UTF8     | en_US.utf8 | en_US.utf8 | =c/postgres          +
                      |          |          |            |            | postgres=CTc/postgres
     template_postgis | postgres | UTF8     | en_US.utf8 | en_US.utf8 | 
    (4 rows)

    postgres=# CREATE DATABASE postgres;
    CREATE DATABASE

    postgres=# exit
    
    bash-4.4# cd var/lib/postgresql/data
    ****if error change one path at a time or might need to change to admin/root****
    **** Copy the dump file inside db directory by navigating as: [project root] > data > db ****
    bash-4.4# psql -U postgres -d postgres -f postgres.sql

