require_relative "../lib/todo_list.rb"
require_relative "../lib/todo.rb"

RSpec.describe "todo list integration" do
  
  describe "#incomplete" do

    context "there are only incomplete todos" do 

      it "returns all todos" do
        my_todos = TodoList.new
        my_todos.add(Todo.new("Walk the dog"))
        my_todos.add(Todo.new("Walk the cat"))
        my_todos.add(Todo.new("Walk the pig"))
        expect(my_todos.incomplete).to eq ["Walk the dog","Walk the cat","Walk the pig"]

      end

    end

    context "there are only complete todos" do 

      it "returns an empty list" do

        my_todos = TodoList.new
        todo_1 = Todo.new("Walk the dog")
        todo_1.mark_done!
        my_todos.add(todo_1)
        todo_2 = Todo.new("Walk the cat")
        todo_2.mark_done!
        my_todos.add(todo_2)
        todo_3 = Todo.new("Walk the dog")
        todo_3.mark_done!
        my_todos.add(todo_3)
        expect(my_todos.incomplete).to eq []

      end

    end

    context "there are a mix of complete and incomplete todos" do 

      it "returns only the incomplete todos" do

        my_todos = TodoList.new
        todo_1 = Todo.new("Walk the dog")
        todo_1.mark_done!
        my_todos.add(todo_1)
        todo_2 = Todo.new("Walk the cat")
        my_todos.add(todo_2)
        todo_3 = Todo.new("Walk the dog")
        todo_3.mark_done!
        my_todos.add(todo_3)
        expect(my_todos.incomplete).to eq ["Walk the cat"]

      end

    end

    context "there are no todos" do 

      it "fails and says no todos" do

        my_todos = TodoList.new
        expect { my_todos.incomplete }.to raise_error "There are no todo items added"

      end

    end
    
  end

  describe "#complete" do

    context "there are only incomplete todos" do 

      it "returns an empty list" do

        my_todos = TodoList.new
        my_todos.add(Todo.new("Walk the dog"))
        my_todos.add(Todo.new("Walk the cat"))
        my_todos.add(Todo.new("Walk the pig"))
        expect(my_todos.complete).to eq []

      end

    end

    context "there are only complete todos" do 

      it "returns all todos" do

        my_todos = TodoList.new
        todo_1 = Todo.new("Walk the dog")
        todo_1.mark_done!
        my_todos.add(todo_1)
        todo_2 = Todo.new("Walk the cat")
        todo_2.mark_done!
        my_todos.add(todo_2)
        todo_3 = Todo.new("Walk the pig")
        todo_3.mark_done!
        my_todos.add(todo_3)
        expect(my_todos.complete).to eq ["Walk the dog","Walk the cat","Walk the pig"]

      end

    end

    context "there are a mix of complete and incomplete todos" do 

      it "returns only the complete todos" do

        my_todos = TodoList.new
        todo_1 = Todo.new("Walk the dog")
        todo_1.mark_done!
        my_todos.add(todo_1)
        todo_2 = Todo.new("Walk the cat")
        my_todos.add(todo_2)
        todo_3 = Todo.new("Walk the pig")
        todo_3.mark_done!
        my_todos.add(todo_3)
        expect(my_todos.complete).to eq ["Walk the dog","Walk the pig"]

      end

    end

    context "there are no todos" do 

      it "fails and says no todos" do

        my_todos = TodoList.new
        expect { my_todos.complete }.to raise_error "There are no todo items added"

      end

    end
    
  end

  describe "#give_up!" do
    
    context "there are only incomplete todos" do 

      it "marks them all as complete" do
        my_todos = TodoList.new
        my_todos.add(Todo.new("Walk the dog"))
        my_todos.add(Todo.new("Walk the cat"))
        my_todos.add(Todo.new("Walk the pig"))
        my_todos.give_up!
        expect(my_todos.complete).to eq ["Walk the dog","Walk the cat","Walk the pig"]

      end

    end

    context "there are a mix of complete and incomplete todos" do 

      it "marks the incomplete as complete" do
        my_todos = TodoList.new
        todo_1 = Todo.new("Walk the dog")
        todo_1.mark_done!
        my_todos.add(todo_1)
        todo_2 = Todo.new("Walk the cat")
        my_todos.add(todo_2)
        todo_3 = Todo.new("Walk the pig")
        todo_3.mark_done!
        my_todos.add(todo_3)
        expect(my_todos.complete).to eq ["Walk the dog","Walk the pig"]
        my_todos.give_up!
        expect(my_todos.complete).to eq ["Walk the dog","Walk the cat","Walk the pig"]

      end

    end

    context "there are no todos" do 

      it "fails and says no todos" do

        my_todos = TodoList.new
        expect { my_todos.complete }.to raise_error "There are no todo items added"

      end

    end


  end

end