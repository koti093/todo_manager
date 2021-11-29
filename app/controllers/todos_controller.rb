class TodosController < ApplicationController
  def index
    @todos = Todo
    #render plain: Todo.all.map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    #render plain: todo.to_pleasant_string.to_s
    render "todos"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date].to_s
    puts due_date
    new_todo = Todo.new(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    if new_todo.save
      redirect_to todos_path
    else
      flash[:error] = new_todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end
  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
