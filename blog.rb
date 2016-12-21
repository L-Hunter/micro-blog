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

#get signin page

#post login

#post logout

#read

#create

#get edit

#post update

#destroy

#get userposts

#get new posts

#post create posts

#get posts by id