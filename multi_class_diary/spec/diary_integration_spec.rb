require_relative "../lib/phone_number_finder.rb"
require_relative "../lib/diary.rb"
require_relative "../lib/diary_entry.rb"

RSpec.describe "Diary Integration Tests" do

  it "adds diary entries to a list and returns them when asked" do

    diary = Diary.new
    entry_1 = DiaryEntry.new("A Title", "Did some stuff")
    entry_2 = DiaryEntry.new("Another Title", "Did some other stuff")
    diary.add(entry_1)
    diary.add(entry_2)
    expect(diary.list).to eq [entry_1,entry_2]

  end

  describe "#reflect" do

    it "returns the entry most readable in the time given" do

      diary = Diary.new
      entry_1 = DiaryEntry.new("A Title", "Did some stuff")
      entry_2 = DiaryEntry.new("Another Title", "Did some other stuff")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.reflect(1,3)).to eq entry_1

    end

  end

  describe "phone number finder behaviour" do

    context "There are no numbers" do

      it "Returns an empty list" do

        diary = Diary.new
        entry_1 = DiaryEntry.new("A Title", "Did some stuff with friends")
        diary.add(entry_1)
        phoneBook = PhoneNumberFinder.new(diary)
        expect(phoneBook.extract_numbers).to eq []
        
      end

    end

    context "There are multiple numbers" do

      it "returns a list of all numbers" do

        diary = Diary.new
        entry_1 = DiaryEntry.new("A Title", "Did some stuff with 07880000000")
        diary.add(entry_1)
        entry_2 = DiaryEntry.new("A Title", "Did some stuff with 07880111111")
        diary.add(entry_2)
        phoneBook = PhoneNumberFinder.new(diary)
        expect(phoneBook.extract_numbers).to eq ["07880000000","07880111111"]
        

      end


    end

    context "There are duplicate numbers" do

      it "returns a list of unique numbers" do

        diary = Diary.new
        entry_1 = DiaryEntry.new("A Title", "Did some stuff with 07880000000")
        diary.add(entry_1)
        entry_2 = DiaryEntry.new("A Title", "Did some stuff with 07880000000")
        diary.add(entry_2)
        phoneBook = PhoneNumberFinder.new(diary)
        expect(phoneBook.extract_numbers).to eq ["07880000000"]

      end

    end



  end
  
end