#폴더 안에 여러개의 파일을 만들고 이름들도 변경하기.
# 0. file.rb는 Ruby23-x64\txt폴더에 있다.

# 1. MultiFileMakeExample 폴더로 들어간다.
Dir.chdir("MultiFileMakeExample")

20.times do |i|
  i+=1
  # 2. 파일을 만든다(연다)
  File.open("newfile#{i}.txt", "w+") do |file|
    # 3. 파일에 내용을 입력한다.
    file.write("hello world")
  end
end
