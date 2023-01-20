# {{Diary}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a user    
> So that I can record my experiences  
> I want to keep a regular diary

> As a user  
> So that I can reflect on my experiences  
> I want to read my past diary entries 

> As a user  
> So that I can reflect on my experiences in my busy day  
> I want to select diary entries to read based on how much time I have and my
> reading speed

> As a user  
> So that I can keep track of my tasks  
> I want to keep a todo list along with my diary

> As a user  
> So that I can keep track of my contacts  
> I want to see a list of all of the mobile phone numbers in all my diary
> entries

## 2. Design the Class System



```ruby
class Diary
  def initialize
    # ...
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Entry gets added to the diary
    # Returns nothing
  end

  def list
    # Returns a list of all entries
  end

  def reflect(wpm, minutes)
    # returns the entry most readable in the time given
  end

end

class DiaryEntry

  def initialize(title, contents) # title and contents are both strings
  end

  def title
    #returns contents of entry as a string
  end

  def contents
    #returns contents of entry as a string
  end

  def word_count
    # returns the number of words in the entry as an integer
  end

end

class PhoneNumberFinder

  def initialize(diary)#diary is an instance of Diary

  end

  def extract_numbers
    # returns a list of strings representing all phone numbers stored in all diary entries
  end

end

class TodoList

  def initialize
  end

  def add(todo)#todo is an instance of Todo
  end

  def list
    #returns a list of all tasks
  end

end

class Todo

  def initialize(task)#task is a string
  end

  def task
    #returns the task as a string
  end


end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# As a user    
# So that I can record my experiences  
# I want to keep a regular diary

# As a user  
# So that I can reflect on my experiences  
# I want to read my past diary entries 

# 1 
diary = Diary.new
entry_1 = DiaryEntry.new("A Title", "Did some stuff")
entry_2 = DiaryEntry.new("Another Title", "Did some other stuff")
diary.add(entry_1)
diary.add(entry_2)
diary.list => #[entry_1,entry_2]

# As a user  
# So that I can reflect on my experiences in my busy day  
# I want to select diary entries to read based on how much time I have and my
# reading speed

# 2
diary = Diary.new
entry_1 = DiaryEntry.new("A Title", "Did some stuff")
entry_2 = DiaryEntry.new("Another Title", "Did some other stuff")
diary.add(entry_1)
diary.add(entry_2)
diary.reflect(1,3) => #entry_1

# As a user  
# So that I can keep track of my tasks  
# I want to keep a todo list along with my diary

# 3
todos = TodoList.new
task_1 = Todo.new("Walk the dog")
task_2 = Todo.new("Walk the pig")
todos.list => #[task_1,task_2]

# As a user  
# So that I can keep track of my contacts  
# I want to see a list of all of the mobile phone numbers in all my diary
# entries

# 4
diary = Diary.new
entry_1 = DiaryEntry.new("A Title", "Did some stuff with 07880000000")
diary.add(entry_1)
phoneBook = PhoneNumberFinder.new(diary)
phoneBook.extract_numbers => #["07880000000"]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# Constructs a Diary Entry
entry = DiaryEntry.new("A Title", "Did some stuff")
entry.contents => #"Did some stuff"

# Constructs a Todo
task = Todo.new("Walk the dog")
task.task => #"Walk the dog"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._