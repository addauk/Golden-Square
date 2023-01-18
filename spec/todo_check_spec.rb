require 'todo_check'

RSpec.describe do
  context "Given some text that starts with `#TODO`" do
    
    it "Returns true" do
      expect(todo_check("#TODO buy milk")).to eq true
    end

  end

  context "Given some text that ends with `#TODO`" do

    it "Returns true" do
      expect(todo_check("buy milk #TODO")).to eq true
    end

  end

  context "Given some text that includes `#TODO` between other text" do

    it "Returns true" do
      expect(todo_check("buy #TODO milk")).to eq true
    end

  end

  context "Given just the string `#TODO`" do

    it "Returns true" do
      expect(todo_check("#TODO")).to eq true
    end

  end

  context "Given some text that includes `#TOD O`. A space in the word `TODO`" do

    it "Returns false" do
      expect(todo_check("buy milk #TOD O")).to eq false
    end

  end

  context "Given some text that includes `#todo`. This is lowercase" do

    it "Returns false" do
      expect(todo_check("buy milk #todo")).to eq false
    end

  end

  context "Given some text that includes `TODO` without the hash" do

    it "Returns false" do
      expect(todo_check("buy milk TODO")).to eq false
    end

  end

  context "Given an empty string" do

    it "Returns false" do
      expect(todo_check("")).to eq false
    end

  end

end