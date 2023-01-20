require_relative "./diary_entry.rb"

class Diary
  def initialize
    @entries = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    # Entry gets added to the diary
    # Returns nothing
    @entries << entry
  end

  def list
    # Returns a list of all entries
    return @entries
  end

  def reflect(wpm, minutes)
    # returns the entry most readable in the time given
    fail "Reading speed must be above zero" unless wpm > 0
    fail "Must have some time to read" unless minutes > 0
    longest = 0
    best_entry = ""
    @entries.each do |entry| 
      time = entry.reading_time(wpm)
      if entry.word_count > longest && time <= minutes
        longest = entry.word_count
        best_entry = entry
      end
    end
    fail "No eligible entries" unless best_entry.word_count > 0
    return best_entry
  end

end
