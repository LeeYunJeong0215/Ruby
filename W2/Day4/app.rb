require 'sinatra'
require 'sinatra/reloader'
#가상환경에서 쓰이는 것
require 'data_mapper' # metagem, requires common plugins too.

# http://recipes.sinatrarb.com/p/models/data_mapper에서 복사
# need install dm-sqlite-adapter
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post # =table
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end

class User # =table
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :pwd, Text
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!
User.auto_upgrade!

set :bind, '0.0.0.0'

before do
  p"*******************"
  p params
  p"*******************"
end

get '/' do
  @posts = Post.all.reverse
  erb :index
end

#form
get '/post' do
  erb :post
end

#결과 보여주는 곳
get '/complete' do
  @title = params[:title]
  @content = params[:content]
  Post.create(:title => @title, :content => @content)
  erb :complete
end

get '/signup' do
  erb :signup
end

get '/usercomplete' do
  @email = params[:email]
  @pwd = params[:pwd]
  User.create(:email => @email, :pwd=> @pwd)
  erb :usercomplete
end

get '/users' do
  @users = User.all.reverse
  erb :users
end
