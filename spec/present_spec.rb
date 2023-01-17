require 'present'

RSpec.describe Present do
  context "When no contents have been wrapped" do
    it "fails" do
      present = Present.new
      expect{ present.unwrap }.to raise_error "No contents have been wrapped." 
    end
  end

  context "When contents have been wrapped" do
    it "can unrwap a present" do
      present = Present.new
      present.wrap("chocolate")
      expect(present.unwrap).to eq "chocolate"
    end 

    it "fails" do
      present = Present.new
      present.wrap("shoes")
      expect{ present.wrap("socks") }.to raise_error "A contents has already been wrapped." 
    end
  end

end