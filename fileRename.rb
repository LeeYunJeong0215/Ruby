# 1. text라는 폴더로 들어간다.
Dir.chdir("MultiFileMakeExample")
# 2. 폴더 내의 파일들을 확인하고 파일명을 수정한다.
  #.reject {|i| i[0] == '.'} 이름 첫번째가 '.'인 파일을 제외
files = Dir.entries(Dir.pwd).reject {|i| i[0] == '.'}
files.each do |name|
  File.rename(name, name.gsub("new", "new_"))
end
