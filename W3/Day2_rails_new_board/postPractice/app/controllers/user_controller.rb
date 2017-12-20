class UserController < ApplicationController

def index
@posts = Post.all.reverse
end

def new
end

def create

  user = User.new
  @post.create(@username => params[:username], @title => params[:title],
                @content => params[:content])

end

end
