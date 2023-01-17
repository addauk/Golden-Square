require 'gratitudes'

RSpec.describe "" do
  it "Initially creates an empty list of gratitudes" do
    gratitudes = Gratitudes.new
    expect(gratitudes.format).to eq "Be grateful for: "
  end

  it "You can add a gratitude and receive a formatted response" do
    gratitudes = Gratitudes.new
    gratitudes.add("coffee")
    gratitudes.add("sun")
    expect(gratitudes.format).to eq "Be grateful for: coffee, sun"
  end

end
