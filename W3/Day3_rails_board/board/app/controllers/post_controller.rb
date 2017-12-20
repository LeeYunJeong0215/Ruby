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
  #post = Post.new
  #post.username = params[:username]
  #post.title = params[:title]
  #post.content = params[:content]
  #post.save

  redirect_to '/'
end

def show
  #어떤 글을 보여주겠다
  @post = Post.find(params[:id])
  @comments = Comment.all
end

def destroy
  #어떤 글을 가져온다
  @post = Post.find(params[:id])
  #강사님 방법

  #@id = params[:id]
  #post = Post.find(@id)
  #post.destroy

  #삭제(destroy)한다
  Post.destroy(params[:id])

  #한 줄로 줄일 수 있다
  #Post.destroy(Post.find(params[:id]))

  #'/' 루트페이지로 보낸다.
  redirect_to '/'
end

def modify
  @post = Post.find(params[:id])

end

def update
  @post = Post.find(params[:id])

  #업데이트 방법 1-1
  @post.update(username: params[:username], title: params[:title], content: params[:content])
  # #업데이트 방법 1-2
  # @post.update(:username => params[:username], :title => params[:title], :content => params[:content])
  # #방법 2
  #
  # @post.username = params[:username]
  # @post.title = params[:title]
  # @post.content = params[:content]
  # @post.save

  #문자열 안에
  redirect_to "/post/show/#{params[:id]}"

end

def add_comment
  Comment.create(
    content: params[:content],
    post_id: params[:id])
  redirect_to :back

end


end
