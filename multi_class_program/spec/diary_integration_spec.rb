require_relative '../lib/diary.rb'
require_relative '../lib/diary_entry.rb'

RSpec.describe "Diary Integration" do
  it "gets all diary entries" do
    dear_diary = Diary.new
    entry_1 = DiaryEntry.new("Today", "I walked my dog")
    entry_2 = DiaryEntry.new("Yesterday", "I ate a pie")
    dear_diary.add(entry_1)
    dear_diary.add(entry_2)
    expect(dear_diary.all).to eq [entry_1, entry_2]
  end

  it "counts the words of all diary entries" do
    dear_diary = Diary.new
    entry_1 = DiaryEntry.new("Today", "I walked my dog")
    entry_2 = DiaryEntry.new("Yesterday", "I ate a pie")
    dear_diary.add(entry_1)
    dear_diary.add(entry_2)
    expect(dear_diary.count_words).to eq 8
  end


end