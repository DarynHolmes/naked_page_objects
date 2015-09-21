# Naked Page Objects
This repo contains the the code, slides and a video from the 'naked page objects' presentation.
This shows the basic pattern that is followed on the fulcrum_specs test suite.
http://stash.vm.wtf.nap/projects/TEST/repos/fulcrum_specs/browse
Fulcrum_specs is likely to be renamed to product_management_specs.

The talk covers the following topics:

* A brief introduction to  Page Objects
* A brief introduction to CSS Selectors
* A brief introduction to Capybara
* A practical example – testing http://demo.nopcommerce.com/
    * We will create tests without page objects
    * We will convert a test so that it uses a page obect
    * We will use ‘sections’ to break up the page object
* A brief introduction to  SitePrism
* Look at how the example above would be implemented in SitePrism
* A look at the base modules in the Fulcrum Specs framework
* Q&A


## Prerequisites
In order to run the tests you need to install:

* Firefox
* Ruby (2.0.0 or later)
* Ruby gems
* Bundler gem (gem install bundler)


## Getting started

Follow these steps to get started:

* Ensure you have the prerequisites (see above)
* Clone the repo locally
* cd into the cloned repo
* run: `bundle install`
* run: `bundle exec rake test`

This will run the tests using Firefox.


# What is in the box?

* fulcrum_specs_lib contains all the framework classes, used by the code in page_objects/nopCom_04

Under the page_objects

* nopCom_00
    * Basic setup with empty tests
* nopCom_01
    * Implemented tests without page objects
* nopCom_02
    * Introduced a basic page object
* nopCom_03
    * Introduced the notion of sections to break up a complex page
* nopCom_04
    * Using the fulcrum_specs_lib framework classes
* nopCom_sp
    * Using site_prism
* nopCom_wip
    * A sandbox, feel free to use it as you like



