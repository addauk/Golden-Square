require 'diary_entry'

RSpec.describe DiaryEntry do
  it "DiaryEntry object can be created and return correct title and contents" do
    diary_entry = DiaryEntry.new("Today","Did some coding")
    expect(diary_entry.title).to eq "Today"
    expect(diary_entry.contents).to eq "Did some coding"
  end

  describe "#count_words" do

    it "Returns the number of words in the contents as an integer" do
      diary_entry = DiaryEntry.new("Today","Did some coding")
      expect(diary_entry.count_words).to eq 3
    end

    it "Returns zero if contents is empty" do
      diary_entry = DiaryEntry.new("Today","")
      expect(diary_entry.count_words).to eq 0
    end


  end

  describe "#reading_time" do

    context "given a reasonable wpm" do
      it "gives the upper limit of minutes based on wpm" do
        diary_entry = DiaryEntry.new("Today","words " * 300)
        expect(diary_entry.reading_time(100)).to eq 3
      end      
    end

    context "given a wpm of 0" do
      it "fails and gives an error message" do
        diary_entry = DiaryEntry.new("Today","words " * 300)
        expect{diary_entry.reading_time(0)}.to raise_error "Reading speed must be above zero"
      end      
    end

  end

  describe "#reading_chunk" do
    context "with a text readable within the given minutes" do
      it "returns the full text" do
        diary_entry = DiaryEntry.new("Today", "This is a story")
        result = diary_entry.reading_chunk(100,1)
        expect(result).to eq "This is a story"
      end
    end

    context "with a text readable within the given minutes" do
      it "returns what can be read in one minute" do
        diary_entry = DiaryEntry.new("Today", "This is a story")
        result = diary_entry.reading_chunk(2,1)
        expect(result).to eq "This is"
      end

      it "returns the next chunk when called again" do
        diary_entry = DiaryEntry.new("Today", "This is a story")
        diary_entry.reading_chunk(2,1)
        result = diary_entry.reading_chunk(2,1)
        expect(result).to eq "a story"
      end

      it "goes back to the start when it runs out of chunks" do
        diary_entry = DiaryEntry.new("Today", "This is a story guys")
        diary_entry.reading_chunk(2,1)
        diary_entry.reading_chunk(2,1)
        diary_entry.reading_chunk(2,1)
        result = diary_entry.reading_chunk(2,1)
        expect(result).to eq "This is"
      end
    end

    context "given a wpm of 0" do
      it "fails and gives an error message" do
        diary_entry = DiaryEntry.new("Today","words " * 300)
        expect{diary_entry.reading_chunk(0,1)}.to raise_error "Reading speed must be above zero"
      end      
    end

    context "given a minutes of 0" do
      it "fails and gives an error message" do
        diary_entry = DiaryEntry.new("Today","words " * 300)
        expect{diary_entry.reading_chunk(1,0)}.to raise_error "Must have some time to read"
      end      
    end

  end
end