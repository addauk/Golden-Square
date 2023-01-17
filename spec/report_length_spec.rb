require 'report_length'

RSpec.describe "report_length method" do
  it "returns a message with the correct length of the string given to it" do
    expect(report_length("hello")).to eq "This string was 5 characters long."
    expect(report_length("h")).to eq "This string was 1 characters long."
    expect(report_length("")).to eq "This string was 0 characters long."
  end
end
