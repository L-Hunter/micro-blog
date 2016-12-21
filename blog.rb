require 'sinatra'
require 'sendgrid-ruby'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models.rb'

set :database, "sqlite3:test.sqlite3"
enable :sessions

get '/' do
	erb :home
end

#get create new users
get '/users/new' do
	erb :newuser
end

#get signin page - add form to home.erb
#post login
post '/login' do
	@user = User.where(email: params['email']).first
	if @user && @user.password == params['password']
		session[:user_id] = @user.id
		flash[:notice] = "Welcome!"
		redirect "/users/#{session[:user_id]}"
	else
		flash[:alert] = "Please, try again."
		redirect '/'
	end
end

#post logout
post '/logout' do
	session[:user_id] = nil
	redirect '/'
end

#read - profile page
get '/users/:id' do
	@user = User.find(params['id'])
	erb :user
end

#create
post '/users/create' do
	@user = User.new(name: params['name'], email: params['email'], password: params['password'])
	@user.save
	redirect "/users/#{@user.id}"
end

#get edit
get '/users/:id/edit' do
	@user = User.find(params['id'])
	erb :settings
end

#post update
post '/users/:id/update' do
	@user = User.find(params['id'])
	@user.update(name: params['name'], email: params['email'], password: params['password'])
	redirect "/users/#{@user.id}"
end

#destroy
post '/users/:id/delete' do
	@user = User.find(params['id'])
	# session[:user_id] = nil
	@user.destroy
	redirect "/"
end

#get userposts

#get new posts

#post create posts

#get posts by id