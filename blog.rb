require 'sinatra'
require 'sendgrid-ruby'
require 'sinatra/activerecord'
require 'sinatra/flash'
require './models.rb'

set :database, "sqlite3:test.sqlite3"

get '/' do
	erb :home
end

#get create new users
get '/users/new' do
	erb :newuser
end

#get signin page

#post login

#post logout

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