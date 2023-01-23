require_relative '../lib/track.rb'

RSpec.describe Track do
  
  it "contstructs" do
    track = Track.new("Holiday", "Madonna")
  end

  describe "#matches?" do
    
    context "keyword is empty" do
      it "fails" do
        track = Track.new("Holiday", "Madonna")
        expect{track.matches?}.to raise_error ArgumentError
      end
    end
    
    context "keyword matches title" do
      it "returns true" do
        track = Track.new("Holiday", "Madonna")
        expect(track.matches?("Holiday")).to eq true
      end
    end
    
    context "keyword matches artist" do
      it "returns true" do
        track = Track.new("Holiday", "Madonna")
        expect(track.matches?("Madonna")).to eq true
      end
    end

    context "keyword matches neither" do
      it "returns false" do
        track = Track.new("Holiday", "Madonna")
        expect(track.matches?("Madge")).to eq false
      end
    end

  end

end