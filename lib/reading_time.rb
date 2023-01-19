require 'count_words'

def reading_time(str)
  count_words(str).to_f()/200*60
end