require_relative "../lib/todo.rb"

RSpec.describe Todo do

  it "#initialize" do
    task = Todo.new("Walk the dog")
  end

  it "#task" do
    task = Todo.new("Walk the dog")
    expect(task.task).to eq "Walk the dog"
  end
  
end