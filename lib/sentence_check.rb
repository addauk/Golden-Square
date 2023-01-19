def sentence_check(sentence)
  /^[A-Z].*[!?.]/.match?(sentence)
end
