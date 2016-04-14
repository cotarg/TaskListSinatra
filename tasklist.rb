require 'sinatra'
require_relative 'lib/database'

class TaskListApp < Sinatra::Base

  get '/' do
    @displayed_task = TaskList::Task.new.all_tasks
    erb :index
  end

  post '/' do
    @task_manager = TaskList::Task.new
    @task_manager.update_task(params["title"], params["description"], params["completed_at"], params["id"])
    @displayed_task = TaskList::Task.new.all_tasks

    erb :index
  end

  get '/add' do
  	erb :add
  end

  post '/add' do
    @task_manager = TaskList::Task.new
    @task_manager.add_task(params["title"], params["description"], params["completed_at"])
    @displayed_task = TaskList::Task.new.all_tasks
    redirect '/'
  end

  get '/edit' do
    @task_manager = TaskList::Task.new
    @retrieved_task = @task_manager.find_task(params["task_id"]).first
    erb :edit
  end

  run!
end
