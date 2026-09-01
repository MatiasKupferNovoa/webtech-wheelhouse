# webtech-wheelhouse
## What is WheelHouse?
Is a system designed for a bicycle repair shop. Its purpose is to help to manage the shop's customers, bikes, repairs, etc. Wheelhouse want to make easy to access the repair information.

## Who uses it?
The main users are:
- Customers: brings a bike to the shop and can approves or reject the repairs.
- Counter staff: Receives customers and bikes and records te information.
- Mechanic: Diagnoses the bikes, record notes for the diagnoses and repair the bikes.
- Owner: Monitor the repairs and manages the shop's service prices.

## Documentation
- [User stories:](docs/user-stories.md)
- [Domain model:](docs/domain-model.md)
- [Decisions:](docs/decisions.md)
-  [Wireframes:](docs/wireframes.md)

## Prerequisites
Install the following softwares before setting up the application
- Ruby 4.0.4
- Rails 8.0
- Node.js 26.1.0
- npm
- Yarn
- PostgreSQL
- Git

Verify if the software's version are good with the following commands respectively:
- ruby -v
- rails -v
- node -v
- npm -v
- yarn -v
- psql --version
- git --version

## Instalation
First, clone the repository with the next command:
- git clone https://github.com/MatiasKupferNovoa/webtech-wheelhouse.git

Then, install the Ruby, JavaScript and Bootstrap dependencies:
- bundle install
- yarn install

Now start PostgreSQL:
- sudo service postgresql start

## Run app
To run the application, you need to use this command:
- bin/dev
