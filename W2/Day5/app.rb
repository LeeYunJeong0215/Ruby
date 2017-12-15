require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

#가상환경에서 Localhost 사용하기 위한 설정
set :bind, '0.0.0.0'

#출처 : http://recipes.sinatrarb.com/p/models/data_mapper
# need install dm-sqlite-adapter
# Datamapper를 사용하는데, db파일을 현재 경로에 blog.db라고 저장하겠다
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")
#Post라는 클래스를 만들고, db(table)을 만든다.
#머리에 엑셀을 생각하길..
class Post
  #DataMapper 리소스 가져오기
  include DataMapper::Resource
  #id는 고유한 값이고, 저장할 수록 1부터 하나씩 증가
  property :id, Serial #id는 반드시 Serial로 유지 시켜줘야 함(자동으로 순서를 정해주므로?)
  #title은 String 타입, 길이 50
  property :title, String
  #content는 Text 타입, 길이 65536
  property :content, Text
  #(자동)날짜 시간을 저장한다.
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models(모델 설정 종료)
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!

get '/' do
  #게시글을 다 보여주는 곳
  @posts = Post.all.reverse
  erb :index
end


#게시글을 입력할 수 있는 곳(=어제의 post와 같음.)
get '/new' do
  erb :new
end

#게시글을 만드는 곳(do에 저장하는 곳)
#CRUD -C(Create)
get '/create' do
  #params[:title] params[:content]가 form에서 넘어온다
  #input/textarea에 **name**으로 설정된 것.
  #p params
  #=>{"title" => 유저가 입력한 것, "content"=>유저가 입력한 것.}
  @title_erb = params[:title]
  @content_erb = params[:content]

  #id와 created_at은 자동 생성됨.
  #db에 저장하자!
  #title, content는 맨 위에 DataMapper에서 설정한 내용.
  #Post라는 table(db)의 Column(열)에 해당하는 것.
  @post = Post.create(:title => @title_erb, :content => @content_erb)
  #erb :create
  redirect '/' #home으로 바로 돌아가게 하는 코드
end

#variable routing : 주소를 통해 변수를 받는것.
#CRUD - Read(읽어오기)
get '/posts/:id' do
  @post = Post.get(params[:id])
  erb :posts
end

#해당하는 데이터 지우기
#CRUD -D(destroy)
get '/destroy/:id' do
  @post = Post.get(params[:id])
  @post.destroy
  redirect '/'
end

#CRUD - U(update)
#1. 사용자에게 form을 입력받는 창

get '/edit/:id' do
  @post = Post.get(params[:id])
  erb :edit
end

#2.실제로 db에 저장
get '/update/:id' do
  @post = Post.get(params[:id])
  @post.update(:title => params[:title], :content => params[:content])
  redirect '/'
end
