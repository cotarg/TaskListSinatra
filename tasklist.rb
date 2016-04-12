require 'sinatra'
require_relative 'lib/database'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/add' do
  	erb :add
  end

run!
end
