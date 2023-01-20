class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todos << todo
  end

  def incomplete
    # Returns all non-done todos
    fail "There are no todo items added" unless @todos.length > 0
    incomplete = @todos.select { |todo| !todo.done? }
    if incomplete.length > 0
      return incomplete.map { |todo| todo.task }
    else
      return []
    end
  end

  def complete
    # Returns all complete todos
    fail "There are no todo items added" unless @todos.length > 0
    complete = @todos.select { |todo| todo.done? }
    if complete.length > 0
      return complete.map { |todo| todo.task }
    else
      return []
    end
  end

  def give_up!
    # Marks all todos as complete
    fail "There are no todo items added" unless @todos.length > 0
    @todos.each { |todo| todo.mark_done! }
  end
end