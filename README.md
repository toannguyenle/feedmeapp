# feedme - ruby

Welcome to feedme. A simple way to discover and purchase food around you.
This document will simplify the process of consuming data from our own API for WDI developers who wish to earn that extra surprise from our lovely instructors. Proceed at your own risk.

with love,

Team STAN - Steve, Natalia and Toan.

## Installation

Clone our repo:

    git clone

And then execute:

    $ bundle

Then creeeeaaaaateeee your database:

    $ rake db:create
    $ rake db:migrate

## API Usage

### Basic usage

When you sign in at our site as a developer you will be provided an API only applicable to our cohorts. Make sure your store the hard-earned API key in a safe a secured place like your bash profile or production environment config vars (like Heroku Config Var).

```
ENV("FM_API_KEY")
```

Note: all four keys are required for making requests against the Yelp API. If you need any keys sign up and get access from [http://www.feedmeapp.herokuapp.com/developers](http://www.feedmeapp.herokuapp.com/developers).

### Schema

You will have access to our lists of products offerings from our partner businesses. Below is the schema:


```
    t.string   "name"
    t.string   "categories"
    t.string   "description"
    t.string   "image_urls"
    t.float    "regular_price"
    t.float    "discount_price"
    t.time     "discount_start_time"
    t.time     "discount_end_time"
    t.integer  "discount_inventory"
    t.string   "ordr"
    t.string   "delivery_method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
```

# Endpoints

Well at last this is what y'all waiting for

```
\api\wdi\[YOUR API KEY]
```
Alternatively, if you are hitting this endpoint from your site it would be 

```
http://feedmeapp.herokuapp.com/api/wdi/[YOUR API KEY]
```

Return format is JSON

### Git Workflow

We are using the [git flow](http://nvie.com/posts/a-successful-git-branching-model/)
workflow. Atlassian has a [solid overview](https://www.atlassian.com/git/workflows#!workflow-gitflow).
Essentially, new development is merged into the develop branch from feature
branches, then merged from develop to a release branch, then to master from
the release branch. Master should always contain the most recently released
version of the gem.
