#A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' if there are more than that.

def make_snippet(str)
  words = str.split()
  newstr = words.first(5).join(" ")
  if words.length > 5 
    newstr += ' ...'
  end
  return newstr
end