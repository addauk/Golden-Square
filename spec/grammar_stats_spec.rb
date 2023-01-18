require 'grammar_stats'

RSpec.describe GrammarStats do
  
  describe '#check' do
    context "Given a sentence with a capital start and a punctuated end" do
      it "Returns true" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("Who are you?")).to eq true
        expect(grammar_stats.check("Valid sentence.")).to eq true
        expect(grammar_stats.check("SHOULD SAY TRUE!")).to eq true
      end
    end
  
    context "Given a sentence with a capital start and an unpunctuated end" do
      it "Returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("This shouldn't work")).to eq false
      end
    end
  
    context "Given a sentence with a lowercase start and a punctuated end" do
      it "Returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("who am I?")).to eq false
        expect(grammar_stats.check("should say false!")).to eq false
        expect(grammar_stats.check("invalid sentence.")).to eq false
      end
    end
  
    context "Given a sentence with a lowercase start and an unpunctuated end" do
      it "Returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("also shouldn't work")).to eq false
      end
    end
  
    context "Given a sentence with a just punctuation" do
      it "Returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("!?")).to eq false
      end
    end
  
    context "Given a sentence with a just a capital" do
      it "Returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("A")).to eq false
      end
    end
  
    context "Given an empty string" do
      it "Returns false" do
        grammar_stats = GrammarStats.new
        expect(grammar_stats.check("") ).to eq false
      end
    end
  end


  describe '#percentage_good' do
    context "given only passing texts" do

      it "returns 100" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Who are you?")
        expect(grammar_stats.percentage_good).to eq 100
      end

    end
  
    context "given only failing texts" do

      it "returns 0" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Who are you")
        expect(grammar_stats.percentage_good).to eq 0
      end

    end

    context "given a mix of passing and failing texts" do

      it "returns the correct percentage passed" do
        grammar_stats = GrammarStats.new
        grammar_stats.check("Who are you?")
        grammar_stats.check("Who are you")
        expect(grammar_stats.percentage_good).to eq 50

      end

    end

    context "if given no texts to perform" do

      it "fails and gives an error message" do
        grammar_stats = GrammarStats.new
        expect{grammar_stats.percentage_good}.to raise_error "No texts have been checked"
      end

    end


  end


end