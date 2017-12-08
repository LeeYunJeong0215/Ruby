#gem을 사용하기 위해 불러온다
#요청을 보내기 위한 httparty
require 'httparty'
#원하는 정보를 가져오기 위한 nokogiri 사용.
require 'nokogiri'

#1. 네이버 국내증시 주소를 url에 저장한다.
url = "http://info.finance.naver.com/marketindex/exchangeDetail.nhn?marketindexCd=FX_JPYKRW"

#2. url을 통해서 요청한다.
response = HTTParty.get(url)

# 3.가져온 문서를 nokogiri 형식으로 저장한다. for 컴퓨터
doc = Nokogiri::HTML(response)

# 4. 문서에서 css 중 id가 KOSPI_now 인것을 kospi라는 변수에 저장
kospi = doc.css("#content > div.spot > div.today > p.no_today")
#("#KOSPI_now") : 크롬에서 마우스 오른쪽 클릭->검사->copy selector

# 4. kospi에 저장된 것 중에서 태그 안에 있는 텍스트만 출력하기.
puts kospi.text.gsub(" ","")
