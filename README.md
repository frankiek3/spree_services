Spree Services
==============

[![Build Status](https://secure.travis-ci.org/frankiek3/spree_services.png)](http://travis-ci.org/frankiek3/spree_services)
[![Build Status](https://travis-ci.org//spree_service.png?branch=master)](https://travis-ci.org//spree_service)

# Spree Service

Spree Services is an extension to Spree (a complete open source commerce solution for Ruby on Rails)
This is a spree extension to enable service

The master branch is compatible with Spree 1.2.x. 1.0.x - 1.1.x versions are available, check the `Versionfile`.

This documentation is not complete and possibly out of date in some cases. There are features that have been implemented that are not documented here, please look at the source for complete documentation.




Install
=======

The extension contains a rails generator that will add the necessary migrations and give you the option to run the migrations, or run them later, perhaps after installing other extensions. The version of the extension used should match the version of Spree being used in accordance with that listed in the Versionfile. Once you have bundled the extension, run the install generator and its ready to use.

      rails generate spree_services:install





## Installation

Add this line to your gemfile:

```shell
gem 'spree_services', github: 'frankiek3/spree_services', branch: 'master'
```

The following terminal commands will copy the migration files to the corresponding directory in your Rails application and apply the migrations to your database.

```shell
bundle exec rails g spree_services:install
bundle exec rake db:migrate
```

Then set any preferences.

### Shipping Configuration

You should create a ShippingMethod based on the Digital Delivery calculator type. It will be detected by `spree_services`. Otherwise your customer will be forced to choose something like "UPS" even if they purchase only downloadable products.


## Usage


### Installation

Get the spree framework and spree_digital extension for it:

```shell
git clone git://github.com/spree/spree.git
git clone git://github.com/frankiek3/spree_services.git
```

Go into the spree directory and run the bundle command:

```shell
cd spree
bundle install
```

Go into the spree_services directory and do the same:

NOTE: At this point you may need to uncomment the stuff in the `Gemfile`  before you can start developing and testing!

```shell
cd spree_services
bundle install
```

Bring up the test application (you only need to do this whenever you fiddle around with the migrations) and then you can run the tests as you please.

```shell
rake test_app
rake spec
```

This link may be very helpful to you: [http://github.com/spree/spree](http://github.com/spree/spree)

### Authors

* [frankiek3](http://github.com/frankiek3/)

### License


