require 'sinatra'
require_relative 'lib/database'

class TaskList < Sinatra::Base

  get '/' do
    erb :index
  end

run!
end
