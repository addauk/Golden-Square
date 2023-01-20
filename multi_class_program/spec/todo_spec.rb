require_relative "../lib/todo.rb"

RSpec.describe Todo do

  it "constructs" do

    todo = Todo.new("Walk the dog")
    expect(todo.task).to eq "Walk the dog"
  
  end

  context "todo isn't done" do

    it "says it isn't done" do

      todo = Todo.new("Walk the dog")
      expect(todo.done?).to eq false

    end

    it "marks the job as done" do

      todo = Todo.new("Walk the dog")
      todo.mark_done!
      expect(todo.done?).to eq true
    
    end
  end


end