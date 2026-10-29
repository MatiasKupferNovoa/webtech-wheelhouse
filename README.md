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
- Libvips

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

Then, install libvips with this command:
- sudo apt install libvips-tools

Now start PostgreSQL:
- sudo service postgresql start

To create the database and load the schema, use this command:
- bin/rails db:setup

## API token setup
To generate your own token, use:
- bin/rails secret

Then open the development credentials with:
- EDITOR="code --wait" bin/rails credentials:edit --environment development

In the file opened, add, replacing Generated_token with your token:
- api_token: Generated_token

## Run app
To run the application, you need to use this command:
- bin/dev
Open http://localhost:3000 and go to Repairs to see the repairs, photo thumbnails, and their diagnosis.

To reload the sample data, use this command:
- bin/rails db:seed

## API usage
Run the app with "bin/dev", then open
[published page](https://matiaskupfernovoa.github.io/webtech-lab-01/)
to see the services and search by ID. Its important that the API must be running locally.

To see the public price list use:
- curl -i http://localhost:3000/api/v1/services

And for request the repairs, use another bash terminal and enter your token:
- read -s -p "Token: " WHEELHOUSE_API_TOKEN
- curl -i -H "Authorization: Bearer $WHEELHOUSE_API_TOKEN" http://localhost:3000/api/v1/repairs

## Development emails
The emails are saved locally in tmp/mails and the mails are not sent over the Internet.
For recover the password, open the generated file and copy the reset link into the browser.
The welcome email preview is available in http://localhost:3000/rails/mailers.

## Development accounts

| Email | Password | Role |
| --- | --- | --- |
| diego@example.com | Diego12345! | mechanic |
| felipe@example.com | Felipe12345! | mechanic |
| martin@example.com | Martin12345! | mechanic |
| paula@example.com | Paula12345! | counter |
| matias@example.com | Matias12345! | owner |
| unassigned@example.com | Unassigned123! | mechanic |

The unassigned account is not linked to a staff member.
If you run the seed, replaces the existing data, accounts and sessions.
