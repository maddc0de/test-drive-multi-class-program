class Todo
  def initialize(task) # task is a string
    @task = task
    @is_done = false
  end

  def task
    @task
  end

  def mark_done!
    @is_done = true
  end

  def done?
    @is_done
  end
end