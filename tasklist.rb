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
    erb :add
  end

run!
end
