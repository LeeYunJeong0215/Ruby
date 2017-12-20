class AskController < ApplicationController
  def index
    @asks = Ask.all.reverse
  end

  def new
  end

  def create
    #방법 1
    asks = Ask.new
    asks.username = params[:username]
    asks.title = params[:title]
    asks.content = params[:content]
    asks.save()

    redirect_to '/'
    #방법 2
    # @ask = Asks.create(
    #   username: params[:username],
    #   title: params[:title],
    #   content: params[:content]
    # )
  end

  def destroy
    tmp = Ask.find(params[:id])
    tmp.destroy

    redirect_to '/'
  end

  def edit
    @ask = Ask.find(params[:id])
  end

  def update
    @ask = Ask.find(params[:id])
    @ask.update(
      username: params[:username],
      title: params[:title],
      content: params[:content]
    )
    redirect_to "/ask/show/#{params[:id]}"
  end
end
