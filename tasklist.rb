require 'sinatra'
require_relative 'lib/database'

class TaskListApp < Sinatra::Base

  get '/' do
    @displayed_task = TaskList::Task.new.all_tasks
    erb :index
  end

  post '/' do
    # this is what happens when you click the Submit button for Edit or Delete
    # @task is just an object that contains the task-related methods, it's not actually creating a new database entry
    @task_manager = TaskList::Task.new
    # using these as the default values for the edit form
    @task_id = params.keys[0].to_i
    @task = @task_manager.edit_task(@task_id)
    redirect '/edit'
  end

  get '/add' do
  	erb :add
  end

  post '/add' do
    @task_manager = TaskList::Task.new
    @task_manager.add_task(params["title"], params["description"], params["completed_at"])
    @displayed_task = TaskList::Task.new.all_tasks
    redirect "/"
  end

  get '/edit' do
    @task_manager = TaskList::Task.new
    # using these as the default values for the edit form
    @task_id = params.keys[0].to_i
    @task = @task_manager.edit_task(@task_id)
    erb :edit
  end

  post '/edit' do
    # this is where the results of the UPDATE go
    @task_manager = TaskList::Task.new
    @task = @task_manager.update_task(params[:title], params[:description], params[:completed_at], params[:id])
    @displayed_task = TaskList::Task.new.all_tasks


    redirect '/'
  end

  run!
end
