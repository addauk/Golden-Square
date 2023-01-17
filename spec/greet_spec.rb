require 'greet'

RSpec.describe "greet method" do
  it "returns 'Hello, name!' where name is the value given" do
    expect(greet('Adam')).to eq "Hello, Adam!"
  end
end