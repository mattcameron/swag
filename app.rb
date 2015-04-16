require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require_relative 'config.rb'
require_relative 'user'
require_relative 'store'
require_relative 'category'
require_relative 'product'
require 'pry'

enable :sessions

before do
		@user = current_user
end

after do
	ActiveRecord::Base.connection.close
end

get '/' do
	if logged_in?
		@products = Product.order(:likes).reverse_order
	else
		@products = Product.order(:likes).reverse_order
	end
		erb :index

end

get '/login' do
	erb :login
end

get '/signup' do
	erb :signup
end

get '/stores/new' do
	redirect to '/login' unless logged_in?
	erb :store_new_page
end

get '/stores' do
	redirect to '/login' unless logged_in?
	@stores = Store.all
	erb :store_index_page
end

get '/product/new' do
	redirect to '/login' unless logged_in?
	@stores = Store.all
	@categories = Category.all
	erb :new_product
end

get '/stores/:storeName/edit' do
	redirect to '/login' unless logged_in?
	@store = Store.where(name: params[:storeName]).first
	erb :store_edit_page
end

get '/stores/:storeName' do
	redirect to '/login' unless logged_in?
	@store = Store.where( name: params[:storeName]).first
	@products = @store.products.order(:likes).reverse_order
	erb :store_show_page
end

get '/stores/:storeName/:productId' do
	redirect to '/login' unless logged_in?
	@store = Store.where( name: params[:storeName]).first
	@product = @store.products.find(params[:productId])
	erb :product_show_page
end

get '/stores/:storeName/:productId/edit' do
	redirect to '/login' unless logged_in?
	@stores = Store.all
	@product = Product.find(params[:productId])
	@categories = Category.all
	erb :product_edit_page
end

get '/search' do
	find_cat = Category.find_by(name: params[:search])

	if !find_cat || find_cat.products.count == 0
		erb :search
	else
		@products = Product.where(category_id: find_cat.id).order(:likes).reverse_order
		erb :index
	end
end

post '/signup' do
	@user = User.create( username: params[:inputUsername], email: params[:inputEmail], password: params[:inputPassword])
		session[:user_id] = @user.id
	redirect to ('/')
end

post '/stores/new' do
	new_store = Store.new
	new_store.name = params[:storeName]
	new_store.url = params[:storeUrl]
	new_store.location = params[:storeLocation]
	new_store.likes = 0
	new_store.save
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

put '/stores/:storeName/edit' do
	store = Store.where(name: params[:storeName]).first
	store.name = params[:storeName]
	store.url = params[:storeUrl]
	store.location = params[:storeLocation]
	store.description = params[:storeDescription]
	store.save
	redirect to '/stores'
end

put '/:storeName/:productId/edit' do
	product = Product.find(params[:productId])
	product.store_id = params[:storeId]
	product.name = params[:productName]
	product.image_url = params[:image_url]
	product.price = params[:price]
	product.description = params[:description]
	if params[:categoryId] == "99"
		new_cat = Category.create(name: params[:newCategory])
		product.category_id = new_cat.id
	else
		product.category_id = params[:categoryId]
	end
	product.save
	redirect to '/'
end

delete '/product/:id/delete' do
	Product.find(params[:id]).delete
	redirect to '/'
end

post '/:productId/newlike' do
	product = Product.find(params[:productId])
	likes = product.likes + 1
	product.update(likes: likes)
end



# API STUFF

get '/api/stores' do
	stores = Store.all
	content_type :json
	stores.to_json
end

get '/api/products' do
	products = Product.all
	content_type :json
	products.to_json
end

get '/api/store/:storeName' do
	store = Store.where(name: params[:storeName]).first
	content_type :json
	store.to_json
end

get '/api/products/:productId' do
	product = Product.find(params[:productId])
	content_type :json
	product.to_json
end


# SESSION STUFF

post '/session' do
	@user = User.where(email: params[:email]).first
	if @user && @user.authenticate(params[:password])
		session[:user_id] = @user.id
		redirect to '/'
	else
		erb :login
	end
end

delete '/session' do
	session[:user_id] = nil
	redirect to '/'
end


helpers do
	def logged_in?
		!!current_user
	end

	def current_user
			User.find_by(id: session[:user_id])
	end
end