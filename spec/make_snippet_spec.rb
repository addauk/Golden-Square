require 'make_snippet'

RSpec.describe "make_snippet method" do
  context "given a string of 5 words" do
    it "takes the first 5 words of a string" do
      expect(make_snippet("this is one fine story")).to eq "this is one fine story"
    end
  end

  context "if there are less than 5 words" do
    it "only takes the first words" do
      expect(make_snippet("i need coffee")).to eq "i need coffee"
    end
  end

  context "if there are more than 5 words" do
    it "gives the first 5 words" do
      expect(make_snippet("i need more and more and more coffee")).to eq "i need more and more ..."
    end
  end

  context "if there are no words" do
    it "returns an empty string " do
      expect(make_snippet("")).to eq ""
    end
  end
end


