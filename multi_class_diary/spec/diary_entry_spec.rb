require_relative "../lib/diary_entry.rb"

RSpec.describe DiaryEntry do

  it "#initializes" do
    entry = DiaryEntry.new("A Title", "Did some stuff")

  end

  describe "#title" do
    
    it "returns the title of the entry as a string" do
      entry = DiaryEntry.new("A Title", "Did some stuff")
      expect(entry.title).to eq "A Title" 
    end

  end

  describe "#contents" do
    
    it "returns the contents of the entry as a string" do
      entry = DiaryEntry.new("A Title", "Did some stuff")
      expect(entry.contents).to eq "Did some stuff" 
    end

  end

  describe "#word_count" do
    
    it "returns the number of words in the entry as an integer" do
      entry = DiaryEntry.new("A Title", "Did some stuff")
      expect(entry.word_count).to eq 3 
    end

  end
  
end