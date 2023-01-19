require_relative '../lib/diary_entry.rb'

RSpec.describe DiaryEntry do
  it "constructs" do
    entry_1 = DiaryEntry.new("Today", "I walked my dog")
  end

  it "returns the title" do
    entry_1 = DiaryEntry.new("Today", "I walked my dog")
    expect(entry_1.title).to eq "Today"
  end

  it "returns the contents" do
    entry_1 = DiaryEntry.new("Today", "I walked my dog")
    expect(entry_1.contents).to eq "I walked my dog"
  end

  describe "#count_words" do
  
    context "there are no contents" do
      
      it "returns the number of words in the contents" do
        entry_1 = DiaryEntry.new("Today", "I walked my dog")
        expect(entry_1.count_words).to eq 4
      end

    end

    context "there are no contents" do
      
      it "returns a value of 0" do
        entry_1 = DiaryEntry.new("Today", "")
        expect(entry_1.count_words).to eq 0
      end
    
    end

  end
end