# DogsRegistry

The application allows you to view and add a list of dogs with race, size, color and image.
The application consists on a:
- Frontend created with Vue3
- Backend created with Laravel 5.3
- MySQL database

# Instructions of use:
## For the database:
- Install MySQL
- Create a user with the following data:
  - Username: dogs_registry_user
  - Password: dogs_registry_user_password
- Run the script: database/scripts/database creation script.sql
- Assign permissions to the dogs_registry_user user to the dogs_registry schema.

## For the back end:
- Install php
- Access the root directory of the project
- Run the command: php artisan serve

## For the front end:
- Install npm
- Access directory: public\dogs_registry
- Run the command: npm run serve