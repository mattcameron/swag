# Swag
[https://swag-app.herokuapp.com/](https://swag-app.herokuapp.com/)

Swag is a marketplace of products from online stores all over the Internet. It exposes users to a large number of visually appealing products for purchase.

- [Github Repo](https://github.com/mattcameron/swag)
- [Project outline](https://gist.github.com/epoch/26528ddb95e2bcf52a49)
- [Trello Board](https://trello.com/b/GBXeXFYC/swag)

### Vision
For this project I wanted to create an application which could have potential real-world application. Having worked very closely with a large number of online stores, I understand the importance and difficulty stores face in getting their products in front of potential customers.

This is because shopping on the Internet is harder than it should be. If I want to buy a pair of shoes, I have to individually find and visit the websites of each shoe company I can think of (or the first handful of results on google...). This is tiresome and inefficient, and it results in many online stores missing out on prospective customers.

In the physical world we have learned to group shops together in shopping centres. This provides ease of access, customer exposure, and creates a positive economic atmosphere.

**Wouldn't it be great if there was one central place on the Internet where you could browse products without all the time and effort?**

Enter Swag.


### Planning
I started out with some mockups made with Balsamiq.

Home Page / Image feed:
![Product Feed](https://github.com/mattcameron/swag/blob/master/mockups/Home%20:%20Search.png?raw=true)

Store page:
![Store page](https://github.com/mattcameron/swag/blob/master/mockups/Store%20page.png?raw=true)

Product page:
![Product page](https://github.com/mattcameron/swag/blob/master/mockups/Product%20Page.png?raw=true)

From here I created my models, installed Bootstrap and started putting together an MVP using a Model-View-Controller framework.

Once the basic skeleton was in place, I continued to add features and functionality, whilst refining the visual style.

Given the way that I planned and executed this project, I was able to implement additional features with confidence that I would not break anything.

### Accounts
Creating an account is as easy as specifying a username, email address, and password. After signing up, users are automatically logged in. When returning to the site, users are able to log in using the log in form.

All passwords are hashed using bCrypt and are stored in their hashed format.

Logged in users can search for products via category using the search bar in the navigation menu, as well as see a listing of all stores using Swag for easy navigation.


### Stores
Logged in users can also easily register their own online stores and add their products and relevant product details to Swag. This will result in users being able to see and purchase their products, with (theoretically) the payments being processed by Swag, and the money being automatically transferred to the store owner (less a small per transaction fee).

### API
The custom API allows public access to both stores and products, and their data attributes.

- [Stores](https://swag-app.herokuapp.com/api/stores)
- [Products](https://swag-app.herokuapp.com/api/products)

Individual stores and products can also be accessed directly via their own api pages.

### Ajax
I used ajax to perform a couple of operations within the application.

##### 'Liking' products
All users are able to 'like' a product by clicking on the heart icon when hovering over that product. This uses ajax to update the product's like count in the database, and if successful update the total on the page without requiring a reload of the page. This works across all three main pages.

##### Removing items from the Shopping cart
After a product has been added to the shopping cart, it is displayed on the '/swagbag' page. Should you decide that you no longer want to purchase this item, it can be removed from the shopping cart by clicking the 'X' button on the right hand side. This uses ajax to update the database via the API and clear the item from the shopping cart without reloading the page.


### Bugs
There are a number of improvements that could still be made to enhance the user experience.

- Sanitising the URLs to be more user-friendly
- Preventing users from being able to 'like' a product multiple times
- Unique shopping carts
- Duplication of products in shopping cart
- Improve design of Product Page


### Future Improvements

- Add payment functionality so products can actually be purchased
- Display custom content for logged in users. e.g saved/favourite products, display a custom feed with products similar to previously 'liked' products.
- Allow users to select products/areas that they are interested in to display the most relevant products for them
- Store credit card details for one click checkout
- Make the site fully mobile-responsive
- Integrate with real online stores to automatically import products, and post information (e.g. inventory updates, order and shipping details) back to the stores once transactions are processed
- Improve search functionality to include fuzzy searching
- Allow products to have multiple categories
- Add a banner image / more detailed Store page

## End Result

I was happy with what I accomplished in a few days (for my first full stack app), however there are still some areas of code which could use some DRYing out and refactoring. I would also have liked to implement the use of partials, and some of the other features mentioned above in Future Improvements.
