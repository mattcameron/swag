require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'config.rb'
require_relative 'user'
require 'pry'


after do
	ActiveRecord::Base.connection.close
end


get '/' do
	erb :index
end

get '/signup' do
	erb :signup
end

post '/login' do
	User.create( username: params[:inputUsername], email: params[:inputEmail], password: params[:inputPassword])
	redirect to ('/')
end

get '/stores' do
	erb :store
end

post '/stores/new' do
	Store.create (name: params[:storeName])
end