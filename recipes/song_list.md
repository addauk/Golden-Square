# {{SongList}} Class Design Recipe

## 1. Describe the Problem

> As a user  
> So that I can keep track of my music listening  
> I want to add tracks I've listened to and see a list of them.  

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class SongList
  def initialize 
    # ...
  end

  def add(track) # track is a string
    # No return value
  end

  def list
    # Throws an exception if no tracks have been added
    # Otherwise, returns a list of songs that have been listened to
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1

song_list = SongList.new
song_list.add("Walk this way")
song_list.list # => ["Walk this way"]

# 2

song_list = SongList.new
song_list.add("Walk this way")
song_list.add("Holiday")
song_list.list # => ["Walk this way","Holiday"]

# 3

song_list = SongList.new
song_list.list # fail "No songs have been added to your list."

```

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._


