require 'sinatra'
require_relative 'lib/database'

class TaskListApp < Sinatra::Base

  get '/' do
    @displayed_task = TaskList::Task.new.all_tasks
    erb :index
  end

  post '/' do
    
  end

  get '/add' do
  	erb :add
  end

  post '/add' do
   
  end

  get '/edit' do
    erb :edit
  end

  post '/edit' do
   
  end

  run!
end
