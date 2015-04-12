require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'config.rb'
require_relative 'user'
require 'pry'


get '/' do
	erb :index
end

get '/login' do
	erb :signup
end

post '/login' do
	User.create( username: params[:InputUsername], email: params[:InputEmail], password: params[:InputPassword])
	redirect to ('/')
end