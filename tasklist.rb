require 'sinatra'
require_relative 'lib/database'

class TaskListApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add' do
  	erb :add
  end

  post '/add' do
    @task = TaskList::Task.new
    @task.add_task(params["title"], params["description"], params["completed_at"])
    erb :index
  end

  run!
end
