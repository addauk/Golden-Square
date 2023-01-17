require 'string_builder'

RSpec.describe StringBuilder do
  it "Initially creates an empty string" do
    string_builder = StringBuilder.new
    expect(string_builder.size).to eq 0
    expect(string_builder.output).to eq ""
  end

  context "Once the string builder has been given some text" do
    
    it "Size returns the correct size of the string" do
      string_builder = StringBuilder.new
      string_builder.add("hello")
      expect(string_builder.size).to eq 5
    end

    it "Output returns the complete string" do
      string_builder = StringBuilder.new
      string_builder.add("hello")
      expect(string_builder.output).to eq "hello"
    end
  end
end

