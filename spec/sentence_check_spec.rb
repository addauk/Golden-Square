require 'sentence_check'

RSpec.describe do
  context "Given a sentence with a capital start and a punctuated end" do
    it "Returns true" do
      expect(sentence_check("Who are you?")).to eq true
      expect(sentence_check("Valid sentence.")).to eq true
      expect(sentence_check("SHOULD SAY TRUE!")).to eq true
    end
  end

  context "Given a sentence with a capital start and an unpunctuated end" do
    it "Returns false" do
      expect(sentence_check("This shouldn't work")).to eq false
    end
  end

  context "Given a sentence with a lowercase start and a punctuated end" do
    it "Returns false" do
      expect(sentence_check("who am I?")).to eq false
      expect(sentence_check("should say false!")).to eq false
      expect(sentence_check("invalid sentence.")).to eq false
    end
  end

  context "Given a sentence with a lowercase start and an unpunctuated end" do
    it "Returns false" do
      expect(sentence_check("also shouldn't work")).to eq false
    end
  end

  context "Given a sentence with a just punctuation" do
    it "Returns false" do
      expect(sentence_check("!?")).to eq false
    end
  end

  context "Given a sentence with a just a capital" do
    it "Returns false" do
      expect(sentence_check("A")).to eq false
    end
  end

  context "Given an empty string" do
    it "Returns false" do
      expect(sentence_check("") ).to eq false
    end
  end
end