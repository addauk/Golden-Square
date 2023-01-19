## 1. Describe the Problem
> As a user
> So that I can keep track of my music listening
> I want to add tracks I've listened to and see a list of them.
## 2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.
```ruby
class ListeningHistory
  def initialize
    @listening_history = []
  end

  def add_track(track) # track is a string
    # Doesn't return anything, adds track to @listening_history
  end

  def get_tracks # no arguments passed
    # Throws an exception if no tasks are passed
    # Returns a list of the tracks added
  end
```
## 3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.
```ruby
# 1
tracks = ListeningHistory.new
tracks.add_track("All Star - Smash Mouth")
tracks.get_tracks # => ["All Star - Smash Mouth"]

# 2
tracks = ListeningHistory.new
tracks.add_track("All Star - Smash Mouth")
tracks.add_track("500 Miles - The Proclaimers")
tracks.get_tracks # => ["All Star - Smash Mouth", "500 Miles - The Proclaimers"]

# 3 
tracks = ListeningHistory.new
tracks.get_tracks # => Returns an empty array

# 4
tracks = ListeningHistory.new
tracks.add_track() # => ArgumentError
```

## 4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.