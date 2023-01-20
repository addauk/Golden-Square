require_relative "../lib/todo.rb"
require_relative "../lib/todo_list.rb"


RSpec.describe "Todo integration" do

  it "adds tasks to a list" do

    todos = TodoList.new
    task_1 = Todo.new("Walk the dog")
    task_2 = Todo.new("Walk the pig")
    todos.add(task_1)
    todos.add(task_2)
    expect(todos.list).to eq [task_1,task_2]


  end
  
end