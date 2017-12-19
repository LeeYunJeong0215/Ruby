class PostController < ApplicationController

def index
  @posts = Post.all.reverse
end

def new
  #form에서 글쓰는 창이니까, 아무것도 없다.
end

def create
  #게시판 생성방법 1
  Post.create(:username => params[:username], :title => params[:title],
  :content => params[:content])

  #게시판 생성방법 2
  post = Post.new
  post.username = params[:username]
  post.title = params[:title]
  post.content = params[:content]
  post.save
end

end
