# README

Rails search demo using Chewy (Elasticsearch)

* If using Docker, skip to \[[Run with Docker\]](https://github.com/GabrielSandoval/search-demo#run-with-docker) section.

## Setup

* Ruby version
`3.2.2`

* System dependencies

  Make sure you have Elasticsearch installed and running:
  ```
  curl localhost:9200
  => {
    "name" : "...",
    "cluster_name" : "...",
    "cluster_uuid" : "...",
    "version" : {
      "number" : "7.17.4",
      "build_flavor" : "default",
      "build_type" : "tar",
      "build_hash" : "79878662c54c886ae89206c685d9f1051a9d6411",
      "build_date" : "2022-05-18T18:04:20.964345128Z",
      "build_snapshot" : false,
      "lucene_version" : "8.11.1",
      "minimum_wire_compatibility_version" : "6.8.0",
      "minimum_index_compatibility_version" : "6.0.0-beta1"
    },
    "tagline" : "You Know, for Search"
  }
  ```

* Clone the app

  ```
  git clone git@github.com:GabrielSandoval/search-demo.git
  ```

* Move to app directory

  ```
  cd search-demo
  ```

* Install gems

  ```
  bundle install
  ```

* Database setup

  ```
  rails db:create
  rails db:migrate
  rails db:seed  # populate your database with 10,000 Article records
  ```

* Search Indexing
  ```
  rails chewy:reset
  ```

* Start the rails server and visit `http://localhost:3000`:
  ```
  rails s
  ```
  ![Screenshot 2023-07-25 at 8 31 28 PM](https://github.com/GabrielSandoval/search-demo/assets/6015897/84ddc9aa-81ab-41f8-ba9b-28265c0fa1da)

## Run with [Docker](https://docs.docker.com/get-docker/)

  1. Build the images
      ```
      docker-compose build
      ```

  2. Create database, run migration, populate tables

     _NOTE: First run may fail due to mysql service not fully running yet - run this command again if that's the case_
      ```
      docker-compose run web rails db:create db:migrate db:seed
      ```

  3. Run Search Indexing
      ```
      docker-compose run web rake chewy:reset
      ```

  4. Start web (Rails) service
      ```
      docker-compose up
      ```
