# {{Todo Check}} Method Design Recipe

## 1. Describe the Problem

> As a user  
> So that I can keep track of my tasks    
> I want to check if a text includes the string `#TODO`.  

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
# EXAMPLE

# `todo_check` checks if some text contains `#TODO`
is_todo = todo_check(some_text)

some_text: a string (e.g. "#TODO buy milk")
is_todo: a boolean value (e.g. true)

# The method doesn't print anything or have any other side-effects
```

## 3. Create Examples as Tests

_Make a list of examples of what the method will take and return._

```ruby
# EXAMPLE

todo_check("#TODO buy milk") => true
todo_check("buy milk #TODO") => true
todo_check("buy #TODO milk") => true
todo_check("#TODO") => true
todo_check("buy milk #todo") => false
todo_check("buy milk #TOD O") => false
todo_check("buy milk TODO") => false
todo_check("") => false

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
