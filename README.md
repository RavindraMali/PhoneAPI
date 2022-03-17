# Phone Number API

Create a fresh RAILS Application with default prostgreSQL database set-up
This application is on rails version
# 7.0.2.3

```bash
    $ rails -v
```
Rails 7.0.2.3

```bash
    $ rails new PhoneAPI -d postgresql
```
-d flag will indicate rails to create default postgreSql configuration into database.yml file.

Make required changes as your local system needed. 

```rails
development:
  <<: *default
  database: PhoneAPI_development
  username: postgres
  password: tatva
  host: localhost
  port: 5432
```
Create model for allocated phone number using rails model generator.

first switch to proect directory.
```bash
    $ cd PhoneAPI/
```
# Generate Model

```bash
    $ rails generate model:AllocatedPhoneNumber PhoneNumber:string
```
this command will generate one activeRecord class and one migration file with PhoneNumber as a string field

check the generated files at there desired location

## model
```rails
    /app/models/allocation_phone_number.rb
```
## migration
```rails
    /db/migrate/20220317044351_create_allocated_phone_numbers.rb
```
## create database and run migrations
```bash
    $ rails db:create
    $ rails db:migrate
```
check your database you'll find three tables including one with phone number allocation.

Now create Controller for API

## Controller
```bash
$ rails generate controller Phone
```
This will create controller file at default desired location in app directory.
 create  app/controllers/phone_controller.rb
      invoke  erb
      create    app/views/phone
      invoke  test_unit
      create    test/controllers/phone_controller_test.rb
      invoke  helper
      create    app/helpers/phone_helper.rb
      invoke    test_unit

Create two methods into this controller 
    - index
    - create

## Routes
Open routes.rb file located at /app/config/routes.rb and add resource route for phone controller.
 ```rails
    resources: phone, :only => [:index, :create]
```
### now create your own logic to implement requirement.

