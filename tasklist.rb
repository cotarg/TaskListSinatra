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
    # this is where @my_score went in the previous project
    # @new_task = Task.new(params)


    # this is the point where it goes into the database. before this was all sinatra.
    # @new_task.add_task(task_to_enter)
    # so we can see the newly updated list of tasks
    erb :index
  end

run!
end
