require_relative '../lib/diary.rb'
require_relative '../lib/diary_entry.rb'

RSpec.describe "Diary Integration" do

  describe "#add" do



  end


  describe "#all" do

    it "there are multiple entries" do
      dear_diary = Diary.new
      entry_1 = DiaryEntry.new("Today", "I walked my dog")
      entry_2 = DiaryEntry.new("Yesterday", "I ate a pie")
      dear_diary.add(entry_1)
      dear_diary.add(entry_2)
      expect(dear_diary.all).to eq [entry_1, entry_2]
    end
  
  end

  describe "#count_words" do

    it "there are multiple entries" do
      dear_diary = Diary.new
      entry_1 = DiaryEntry.new("Today", "I walked my dog")
      entry_2 = DiaryEntry.new("Yesterday", "I ate a pie")
      dear_diary.add(entry_1)
      dear_diary.add(entry_2)
      expect(dear_diary.count_words).to eq 8
    end


  end

  describe "#reading_time" do

    context "given a reasonable wpm" do
      it "gives the upper limit of minutes based on wpm" do
        dear_diary = Diary.new
        diary_entry = DiaryEntry.new("Today","words " * 300)
        dear_diary.add(diary_entry)
        expect(dear_diary.reading_time(100)).to eq 3
      end      
    end

    context "given a wpm of 0" do
      it "fails and gives an error message" do
        dear_diary = Diary.new
        diary_entry = DiaryEntry.new("Today","words " * 300)
        dear_diary.add(diary_entry)
        expect{dear_diary.reading_time(0)}.to raise_error "Reading speed must be above zero"
      end      
    end

  end

  describe "#find_best_entry_for_reading_time" do

    context "given a wpm of 0" do
      it "fails and gives an error message" do
        dear_diary = Diary.new
        diary_entry = DiaryEntry.new("Today","words " * 300)
        dear_diary.add(diary_entry)
        expect{dear_diary.find_best_entry_for_reading_time(0,1)}.to raise_error "Reading speed must be above zero"
      end      
    end

    context "given a minutes of 0" do
      it "fails and gives an error message" do
        dear_diary = Diary.new
        diary_entry = DiaryEntry.new("Today","words " * 300)
        dear_diary.add(diary_entry)
        expect{dear_diary.find_best_entry_for_reading_time(1,0)}.to raise_error  "Must have some time to read"
      end      
    end

    context "with no viable entries" do
      it "fails and gives an error message" do
        dear_diary = Diary.new
        diary_entry = DiaryEntry.new("Today","words " * 300)
        dear_diary.add(diary_entry)
        expect{dear_diary.find_best_entry_for_reading_time(1,1)}.to raise_error  "No eligible entries"
      end      
    end

    context "with viable entries" do
      it "returns the most suited entry" do
        dear_diary = Diary.new
        entry_string = "words " * 300
        diary_entry = DiaryEntry.new("Today",entry_string)
        dear_diary.add(diary_entry)
        padding_entries = DiaryEntry.new("Yesterday", "yo "*200)
        dear_diary.add(padding_entries)
        dear_diary.add(padding_entries)
        dear_diary.add(padding_entries)
        dear_diary.add(padding_entries)
        expect(dear_diary.find_best_entry_for_reading_time(300,1)).to eq  entry_string
      end      
    end

  end

end