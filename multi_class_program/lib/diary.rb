require_relative './diary_entry.rb'

class Diary
  def initialize
    @entries = []
    @word_count = 0
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Returns nothing
    @entries << entry
  end

  def all
    # Returns a list of instances of DiaryEntry
    return @entries
  end

  def count_words
    # Returns the number of words in all diary entries
    # HINT: This method should make use of the `count_words` method on DiaryEntry.
    @entries.each { |entry| @word_count += entry.count_words }
    return @word_count
  end

  def reading_time(wpm) # wpm is an integer representing
    # the number of words the user can read per minute
    # Returns an integer representing an estimate of the reading time in minutes
    # if the user were to read all entries in the diary.
    fail "Reading speed must be above zero" unless wpm > 0
    return (count_words/wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    # `wpm` is an integer representing the number of words the user can read
    # per minute.
    # `minutes` is an integer representing the number of minutes the user
    # has to read.
    # Returns an instance of diary entry representing the entry that is closest 
    # to, but not over, the length that the user could read in the minutes they
    # have available given their reading speed.
    fail "Reading speed must be above zero" unless wpm > 0
    fail "Must have some time to read" unless minutes > 0
    longest = 0
    best_entry = ""
    @entries.each do |entry| 
      time = entry.reading_time(wpm)
      if entry.count_words > longest && time <= minutes
        longest = entry.count_words
        best_entry = entry.contents
      end
    end
    fail "No eligible entries" unless best_entry.length > 0
    return best_entry  
  end
end