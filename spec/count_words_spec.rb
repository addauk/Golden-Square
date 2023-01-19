require 'count_words'

RSpec.describe "count_words method" do
  context "given an empty string" do
    it "returns 0" do
      expect(count_words("")).to eq 0
    end
  end
  
  context "given a string with one word" do
    it "returns 1" do
      expect(count_words("sun")).to eq 1
    end
  end

  context "given a string with more than one word" do
    it "returns the number of words" do
      expect(count_words("this is a story")).to eq 4
    end
  end
end