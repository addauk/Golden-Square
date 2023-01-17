require 'check_codeword'

RSpec.describe "check_codeword method" do
  it "returns a correct message if given the correct codeword" do
    expect(check_codeword("horse")).to eq "Correct! Come in."
  end

  it "returns a wrong message if given the wrong codeword" do
    expect(check_codeword("cow")).to eq "WRONG!"
  end

  it "returns a close message if given a codeword with the correct first and last characters" do
    
    expect(check_codeword("hose")).to eq "Close, but nope."
  end
end
