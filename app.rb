require 'sinatra'
require 'sinatra/reloader'
require_relative 'user'


get '/' do
	erb :index
end