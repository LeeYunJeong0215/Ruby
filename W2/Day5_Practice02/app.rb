require 'sinatra'
require 'sinatra/reloader'

require 'data_mapper' # metagem, requires common plugins too.

set :bind, '0.0.0.0'

# need install dm-sqlite-adapter
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!

get '/' do
  @posts = Post.all.reverse
  erb :index
end

get '/input' do
  erb :input
end

get '/create' do
  @title = params[:title]
  @content = params[:content]

  @post = Post.create(:title => @title, :content => @content)
  redirect '/'
end

# Read
get '/posts/:id' do
  @post = Post.get(params[:id])
  erb :posts
end

# destroy
get '/destroy/:id' do
  @post = Post.get(params[:id])
  @post.destroy

  redirect '/'
end

# update
# 1. 보여주는 창
get '/edit/:id' do
  @post = Post.get(params[:id])
  erb :edit

end

#2. 수정한 내용 실제 db에 저장
get '/update/:id' do
  @post = Post.get(params[:id])
  @post.update(:title => params[:title], :content => params[:content])

  erb :posts
  redirect '/'

end
