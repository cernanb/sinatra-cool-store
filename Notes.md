
1. Write the test
2. Make the test fail/error out
3. Write the simplest code that could make the test pass.
4. Refactor to improve

When writing the test
1. define the data
2. describe the behavior


Store

User
first name required
last name required
email required

have many carts

Item
name
inventory
price

belong to a cart

Cart
status

have many items
belong to a user


Homework
Create a test in the cart_spec for an instance method called `checkout`
- assign the total of the cart to an attribute for the user called `total_spent`
- reduces the inventory of each item by 1
- changes the status of the cart from pending to submitted
