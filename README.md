[![Build Status](https://travis-ci.org/rubyclerks/sales_clerk.svg?branch=master)](https://travis-ci.org/rubyclerks/sales_clerk)
[![Code Climate](https://codeclimate.com/github/rubyclerks/sales_clerk/badges/gpa.svg)](https://codeclimate.com/github/rubyclerks/sales_clerk)
[![Test Coverage](https://codeclimate.com/github/rubyclerks/sales_clerk/badges/coverage.svg)](https://codeclimate.com/github/rubyclerks/sales_clerk)

# Sales Clerk

The online shop of rubyclerks serves two major functions:

- functionally it is the online store
- technically it is your main repository (see installation)

This is a bit like a skin/template for a shop. There will be others with different styles and only for product display. 

See it [**online here**](http://auringostaitaan.fi/), but please don't create accounts. To see the admin side, read the
[guides](http://rubyclerks.org/user_guide/01_index.html) or clone the repository.

## Rubyclerks, OfficeClerk

Rubyclerks is a complete small buisness management solution. 
[OfficeClerk](https://github.com/rubyclerks/office_clerk) is the main backend and provides most of the functionality.

Other Clerks provide functionality like:

- [AccountantClerk](https://github.com/rubyclerks/accountant_clerk): sales reports and purchase help
- [PrintClerk](https://github.com/rubyclerks/print_clerk): Invoice generation
- [PostClerk](https://github.com/rubyclerks/post_clerk): Shipping by Post options

In this respect SalesClerk is the online shop that you may (or may not) wish to run. 
The SalesClerk application uses all of the above extensions.

## Views and ownership

As most of the functionality is actually in the other clerks, 
SalesClek contains mostly "just" the views that make up how a shop looks.

We say "just", as this is not a small matter for anyone but the most tech-oriented. Previous experience has shown 
though, that tastes vary greatly and so there is little sense in even trying to make this a general thing.

Technically speaking SalesClerk is a Rails4 application, while all other clerks are Rails Engines.

# Installation

The installation instructions here focus on the case of a new shop (or a tryout). In case you have an existing rails application and want to add e-commerce functionality to it, please read the online developer guide (or see office_clerk for now). In that case you will probably want to grab the views and ShopController from this repository to start you 
on making a front end.

### Clone

The quickest way to get started is to clone this repository, 

```
  git clone https://github.com/rubyclerks/sales_clerk.git
  cd sales_clerk
  bundle
```

### Get running

Assuming db settings are ok (sqlite), create the db

```
  rake db:migrate
```

and either create a user manually in the rails console (with admin => true) or use the task

```
  rake db:create_admin
```

to create an admin with email admin@example.com and password password.

```
  rails s
```

and you're up. Though that is wuite a bleak view witout categories, so you will probalby want to log in (top right)
and start creating some.
 
### Configuration

RubyClerks configuration is in config *files* , specifically config/locales/config.yml

Off course you may wish to add or remove other clerks or extensions by adding them to your Gemfile.

### Take ownership

Change the name of your directory, remove the .git directory in it and possibly create a new by using git init.

Alternatively you may fork the project on github and then rename it.

### Start developing

The app is mostly views and assets, which you will want to change.

## Contribute

Most new features should be possible as extensions. If you have one that you think will be useful to others and you will maintain in the future, we may add it to the rubyclerks organisation.

Off course if you find bugs or have additions to the other clerks, see there for guidelines.

## Further reading

The [Userguide](http://rubyclerks.org/user_guide/01_index.html) is almost done, and there will be a developer guide (soon).

Also there is a [google group](https://groups.google.com/forum/#!forum/rubyclerks) where you can connect with other developers.

