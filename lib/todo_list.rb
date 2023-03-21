class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    @todo_list << todo
  end

  def incomplete
    @todo_list.select do |todo|
      !todo.done?
    end
  end

  def complete
    # Returns all complete todos
    @todo_list.select do |todo|
      todo.done?
    end
  end

  def give_up!
    # Marks all todos as complete
    @todo_list.each do |todo|
      todo.mark_done!
    end
  end
end