require 'sinatra'
require_relative 'lib/database'

class TaskListApp < Sinatra::Base

  get '/' do
    @displayed_task = TaskList::Task.new.all_tasks
    erb :index
  end

  get '/add' do
  	erb :add
  end

  post '/add' do
    @task = TaskList::Task.new
    @task.add_task(params["title"], params["description"], params["completed_at"])
    @displayed_task = TaskList::Task.new.all_tasks
    erb :index
  end

  run!
end
