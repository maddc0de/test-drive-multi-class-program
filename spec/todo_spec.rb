require 'todo'

RSpec.describe Todo do
  it "constructs" do
    todo_1 = Todo.new("walk the doggo")
    expect(todo_1.task).to eq "walk the doggo"
  end

  it "marks task as done" do
    todo_1 = Todo.new("walk the doggo")
    todo_1.mark_done!
    expect(todo_1.done?).to eq true
  end
end