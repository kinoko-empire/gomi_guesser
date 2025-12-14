# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Basic Dev setup

1. Install Ruby and Node on your machine. I am using `nvm` for Node.js version management, and `rbenv` to manage Ruby versions. The versions currently used for the project are Node.js v22.13.0 and Ruby 3.2.2 - these are used locally as well as on the production Docker image that runs the app.
2. Run `rbenv install 3.2.2` (or whichever version is specified in the `.ruby-version` file) to install the version of Ruby that the project uses. Afterwards, navigating into the project directory should automatically set the correct ruby version. Running `nvm install` when inside the project directory should download and use the specified Node version.
3. Run Rails migrations and seed the development database by running `rails db:setup`. You can connect to the dev database through the command line by running `sqlite3 storage/development.sqlite3` while in the root directory of the project, then run `select count(*) from prefectures;` and `select * from municipalities;` to make sure there is data.
4. Run `npm install` (alternatively `yarn install` or `pnpm install`) to install Node dependencies.
5. Start the app in development mode by running `bin/dev`.

TODO: set up dev containers/Docker dev setup

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
