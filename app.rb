require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'config.rb'
require_relative 'user'
require_relative 'store'
require_relative 'category'
require_relative 'product'
require 'pry'


after do
	ActiveRecord::Base.connection.close
end


# ALLOWS US TO USE THIS VARIABLE IN ALLLLL PAGES. e.g if in layout.erb

# before do
# 	@variable = blah blach
# end


get '/' do
	@products = Product.order("RANDOM()")
	erb :index
end

get '/signup' do
	erb :signup
end

get '/stores/new' do
	erb :new_store
end

get '/stores' do
	@stores = Store.all
	erb :stores
end

get '/product/new' do
	@stores = Store.all
	@categories = Category.all
	erb :new_product
end

get '/stores/:storeName' do
	@store = Store.where( name: params[:storeName]).first
	@products = @store.products
	erb :store_show_page
end

get '/stores/:storeName/:productId' do
	@store = Store.where( name: params[:storeName]).first
	@product = @store.products.find(params[:productId])
	erb :product_show_page
end

post '/signup' do
	User.create( username: params[:inputUsername], email: params[:inputEmail], password: params[:inputPassword])
	redirect to ('/')
end

post '/stores/new' do
	Store.create(name: params[:storeName])
	redirect to ('/')
end

post '/product/new' do
	new_product = Product.new
	new_product.store_id = params[:storeId]
	new_product.name = params[:productName]
	new_product.image_url = params[:image_url]
	new_product.price = params[:price]
	new_product.likes = 0
	new_product.description = params[:description]
	if params[:categoryId] == "99"
		new_cat = Category.create(name: params[:newCategory])
		new_product.category_id = new_cat.id
	else
		new_product.category_id = params[:categoryId]
	end
	new_product.save
	redirect to ('/')
end