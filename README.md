# ums
# Django Template in Docker


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

Now you should be able to access your django server on http://localhost:8000.

 ## Status and Logs
 For viewing status of your docker container.

    $docker-compose ps
     Name               Command               State           Ports
    ------------------------------------------------------------------------
    nginx    /docker-entrypoint.sh ngin ...   Up      0.0.0.0:80->80/tcp
    web      sh entrypoint.sh                 Up      0.0.0.0:8001->8001/tcp
    worker   celery -A project worker - ...   Up

For viewing logs of your docker services.

    $ docker-compose logs [containername]
     Apply all migrations: account, admin, auth, authtoken, contenttypes, core, sessions, sites, socialaccount, user
    Running migrations:
      Applying contenttypes.0001_initial... OK
      Applying contenttypes.0002_remove_content_type_name... OK
      Applying auth.0001_initial... OK