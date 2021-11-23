class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end
  def due_today?
    due_date == Date.today
  end
  def self.overdue
    where("due_date < ?", Date.today)
  end
  def self.due_today
    where("due_date = ?", Date.today)
  end
  def self.duelater
    where("due_date > ?", Date.today)
  end
  def self.completed
    all.where(completed: true)
  end
  def self.complete
    all.where(completed: false)
  end
  def self.show_list
    puts "My Todo-List\n\n"
    puts "Overdue\n"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Today\n"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\n\n"
    puts "Due Later\n"
    puts duelater.map { |todo| todo.to_displayable_string }
  end
  def self.mark_as_complete(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = true
    todo.save
    todo
  end
end
