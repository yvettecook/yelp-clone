#Yelp Clone
A Ruby-on-Rails application to list local restaurants and reviews

#Week 8

Makers Academy Week 8 project, using the popular website [Yelp](http://www.yelp.co.uk) as a model

![Yelp screenshot](https://github.com/makersacademy/course/raw/master/images/yelp.jpg)

##Spec

**Version 1**
Users of the site:

* can add new restaurants,
* can create new restaurants using a form, specifying a name and rating,
* can leave reviews for restaurants, providing a numerical score (1-5) and a comment about their experience,
* view a restaurants listings page, which should display all the reviews, along with the average rating of each restaurant
* Validations should be in place for the restaurant and review forms - restaurants must be given a name and rating, reviews must be given a rating from 1-5 (comment is optional)

**Version 2

* Users can log in with facebook
* A user must be logged in to create restaurants
* User can only edit/delete restaurants which they've created
* Users can only leave one review per restaurant
* User can delete their own reviews
* Some indication should be given on the page whether the user is currenty logged in, with links to the available actions
* The email address of the reviewer should be displayed as part of the review
* (Optional) Users can't review a restaurant which they created


##Tools Used

* Ruby on Rails (4.1.7)
* RSpec-Rails
* Capybara
* Active Record

## Learning Goals:

* Creating Rails applications
* Getting used to the structure of Rails apps (MVC, the router, helpers)
* TDD in Rails, with RSpec & Capybara
* Associations
* Validations
* AJAX in Rails
