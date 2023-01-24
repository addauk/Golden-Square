require_relative '../lib/cat_facts.rb'

RSpec.describe CatFacts do
  
  it "Returns a random cat fact requested from an api" do

    fake_requester = double :requester
    allow(fake_requester).to receive(:get).with(
      URI('https://catfact.ninja/fact')
    ).and_return(%Q[{"fact":"A cat's hearing is much more sensitive than humans and dogs.","length":60}])

    cat_facts = CatFacts.new(fake_requester)

    expect(cat_facts.provide).to eq "Cat fact: A cat's hearing is much more sensitive than humans and dogs."


  end



end
