# {{Todo list}} Class Design Recipe

## 1. Describe the Problem

> As a user  
> So that I can focus on tasks to complete  
> I want to mark tasks as complete and have them disappear from the list.  

> As a user  
> So that I can keep track of my tasks  
> I want a program that I can add todo tasks to and see a list of them.  


## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TodoList
  def initialize() 
    
  end

  def add(todo) # todo is a string
    # No return value
  end

  def list
    # Return a list of uncompleted tasks as strings
  end

  def complete(todo) #todo is a string representing which is completed
    # returns true if the todo exists
    # fails with an error if it doesn't
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# 1
todo_list = TodoList.new
todo_list.list # => []

# 2
todo_list = TodoList.new
todo_list.add("Make coffee")
todo_list.list # => ["Make coffee"]

# 3
todo_list = TodoList.new
todo_list.add("Make coffee")
todo_list.add("Make porridge")
todo_list.list # => ["Make coffee","Make porridge"]

# 4
todo_list = TodoList.new
todo_list.add("Make coffee")
todo_list.add("Make porridge")
todo_list.complete("Make coffee")
todo_list.list # => ["Make porridge"]

# 4
todo_list = TodoList.new
todo_list.add("Make coffee")
todo_list.add("Make porridge")
todo_list.complete("Make coffee")
todo_list.complete("Make coffee") # fails "TODO list item "Make coffee" doesn't exist"


```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


