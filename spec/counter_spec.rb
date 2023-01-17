require 'counter'

RSpec.describe Counter do
  it "Counter can be created, add method adds numbers and message gives correct values" do
    counter  = Counter.new
    expect(counter.report).to eq "Counted to 0 so far."
    counter.add(1)
    expect(counter.report).to eq "Counted to 1 so far."
    counter.add(100)
    expect(counter.report).to eq "Counted to 101 so far."
  end  
end