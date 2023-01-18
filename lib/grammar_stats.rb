class GrammarStats
  def initialize
    # ...
    @texts_checked = 0
    @texts_passed = 0
  end

  def check(text) # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    @texts_checked += 1
    if /^[A-Z].*[!?.]/.match?(text)
      @texts_passed += 1
      true
    else
      false
    end
  end

  def percentage_good
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
    calculate_percentage
  end

  private

  def calculate_percentage
    fail "No texts have been checked" unless @texts_checked > 0
    sum = @texts_passed.to_f/@texts_checked.to_f
    per = sum*100
    #p "There are #{@texts_passed} of #{@texts_checked} which is #{per} percent"
    return per.to_i 

  end
end