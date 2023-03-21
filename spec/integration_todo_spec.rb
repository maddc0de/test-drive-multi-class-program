require 'todo'
require 'todo_list'

RSpec.describe "todo integration" do
  it "add todo and returns the list" do
    list = TodoList.new
    todo_1 = Todo.new("walk the doggo")
    list.add(todo_1)
    expect(list.incomplete).to eq [todo_1]
  end

  it "returns list of completed todos" do
    list = TodoList.new
    todo_1 = Todo.new("walk the doggo")
    todo_2 = Todo.new("eat lunch")
    list.add(todo_1)
    list.add(todo_2)
    todo_1.mark_done!
    expect(list.complete).to eq [todo_1]
  end

  it "returns list of incompleted todos" do
    list = TodoList.new
    todo_1 = Todo.new("walk the doggo")
    todo_2 = Todo.new("eat lunch")
    list.add(todo_1)
    list.add(todo_2)
    todo_1.mark_done!
    expect(list.incomplete).to eq [todo_2]
  end

  it "marks all todos as complete" do
    list = TodoList.new
    todo_1 = Todo.new("walk the doggo")
    todo_2 = Todo.new("eat lunch")
    list.add(todo_1)
    list.add(todo_2)
    todo_1.mark_done!
    list.give_up!
    expect(list.complete).to eq [todo_1, todo_2]
  end


end