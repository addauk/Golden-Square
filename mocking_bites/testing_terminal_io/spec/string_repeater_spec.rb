require_relative '../lib/string_repeater.rb'

RSpec.describe StringRepeater do
  
  it "takes in a string and a number and repeats the string an amount based on the number" do

    io = double :io

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("10").ordered
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX").ordered

    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end

  it "fails if given a string instead of a number" do
    
    io = double :io

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("not a number").ordered

    string_repeater = StringRepeater.new(io)
    expect { string_repeater.run }.to raise_error "You must enter a positive number"

  end

  it "fails if given a negtive number" do
    
    io = double :io

    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX").ordered
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("-2").ordered

    string_repeater = StringRepeater.new(io)
    expect { string_repeater.run }.to raise_error "You must enter a positive number"

  end

end