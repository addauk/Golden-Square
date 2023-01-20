class DiaryEntry

  def initialize(title, contents) # title and contents are both strings
    @contents = contents
    @title = title
  end

  def title
    #returns contents of entry as a string
    return @title
  end

  def contents
    #returns contents of entry as a string
    return @contents
  end

  def word_count
    # returns the number of words in the entry as an integer
    return words.length
  end

  def reading_time(wpm)
    fail "Reading speed must be above zero" unless wpm > 0
    return (word_count/wpm.to_f).ceil
  end

  private

  def words
    @contents.split
  end

end
