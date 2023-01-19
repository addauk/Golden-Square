class TodoList
  def initialize
    @todos = []
  end

  def list
    return @todos
  end

  def add(todo)
    @todos << todo
  end

  def complete(todo)
    fail "TODO list item '#{todo}' doesn't exist" unless @todos.include? todo
    @todos.delete(todo)
    return true
  end

end