#### 새로운 레일즈 생성

```console
$ rails new 영어프로젝트명
$ rails generate controller 컨트롤러명
```

#### 레일즈에서 controller 지우기

```console
$ rails d controller controller명
```

#### 레일즈에서 db생성 하기

```console
1. post라는 모델을 만들었다(모델을 만들었다고 실제 db가 생기는게 아님):
$ rails g model post

2. migrate내에서 테이블 생성 후(atom에서 작업)

3. 실제로 db 생성 
$ rake db:migrate

4. ***db 지우기*** 
$ rake db:drop

```

#### 레일즈에서 gem 파일 설치하기

```console
1. Gemfile에 gem install 명령어 입력(atom에서)
 group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  ***gem 'rails_db'*** -> 이걸 추가
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
2. 파일 설치 명령어
   $ bundle install
```

게시판 예쁘게 꾸미기 : https://getbootstrap.com/



