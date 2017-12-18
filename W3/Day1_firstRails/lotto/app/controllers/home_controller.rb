class HomeController < ApplicationController
  # 컨트롤러는 액션의 모음이다.
  # 모델과 뷰 사이의 중간관리자이다.
  # action
  # app/views/컨트롤러이름/액션이름.html.erb
  # app/views/home/index.html.erb
  def index
  end
  # action
  # app/views/home/lotto.html.erb
  def lotto
    @lotto = (1..45).to_a.sample(6).sort
  end

  def welcome
    @name = params[:name]
  end

  def square
    @num = params[:num]
  end

  def lunch
    @lunch = ["20층", "이자까야", "김밥카페"].sample
    @img_url = {
      "20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/e35/13269473_142818129464432_1648476044_n.jpg",
      "이자까야" => "http://cfile6.uf.tistory.com/image/262728475492610A37727C",
      "김밥까페" => "http://cfile201.uf.daum.net/image/2710CD48519C1A711B97EA"
    }
  end

  def google
  end

  def vote
  end

  def result
    @vote = params[:vote]
  end

  def random
  end

  def rc
    @names = params[:username]

    @var1 = ["사랑", "행복", "허세", "자존심", "유머"]
    @var2 = ["한스푼", "두스푼", "다섯스푼", "쏟아부었다"].sample
  end


end
