require 'todo_list'

RSpec.describe TodoList do
  context "given no tasks" do
    
    it "gives an empty list" do
      todo_list = TodoList.new
      expect(todo_list.list).to eq []
    end
  
  end

  context "given a task" do
    
    it "has a task in the list" do
      todo_list = TodoList.new
      todo_list.add("Make coffee")
      expect(todo_list.list).to eq ["Make coffee"] 
    end

  end

  context "given multiple tasks" do
    
    it "has the tasks in the list" do
      todo_list = TodoList.new
      todo_list.add("Make coffee")
      todo_list.add("Make porridge")
      expect(todo_list.list).to eq ["Make coffee","Make porridge"] 
    end

  end

  context "we complete a task" do
    
    it "has the correct tasks in the list" do
      todo_list = TodoList.new
      todo_list.add("Make coffee")
      todo_list.add("Make porridge")
      todo_list.complete("Make coffee")
      expect(todo_list.list).to eq ["Make porridge"] 
    end

  end

  context "we try to complete a task that doesn't exist" do
    
    it "fails" do
      todo_list = TodoList.new
      todo_list.add("Make porridge")
      expect {todo_list.complete("Make coffee")}.to raise_error "TODO list item 'Make coffee' doesn't exist"

    end

  end

end