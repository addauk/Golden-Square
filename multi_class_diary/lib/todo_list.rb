require_relative "./todo.rb"
class TodoList

  def initialize
    @todos = []
  end

  def add(todo)#todo is an instance of Todo
    @todos << todo
  end

  def list
    #returns a list of all tasks
    return @todos
  end

end
