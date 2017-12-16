마크다운 사용법 : https://gist.github.com/ihoneymon/652be052a0727ad59601

## 처음에 github에 올릴 때

1. 해당 폴더에서 git을 사용(로컬저장소 : 1회만 하면 됨.) :
  `git init`
2. 해당 폴더 내에 있는 모든 파일들의 변경사항을 기록 :
  `git add .`
3. 지금까지의 변경 사항들을 커밋 :
  `git commit -m "원하는 커밋 메시지"`
4. 내가 사용할 원격저장소 지정:
  `git remote add origin "https://github.com/LeeYunJeong0215/Ruby.git"`
5. 원격저장소에 파일들을 보냄 :
  `git push origin master`

## 파일을 수정한 후에 올릴 때
1. 해당 폴더 내에 있는 모든 파일들의 변경사항을 기록 :
  `git add .`
2. 지금까지의 변경 사항들을 커밋 :
  `git commit -m "원하는 커밋 메시지"`
3. 원격저장소에 파일들을 보냄 :
  `git push origin master`

## 파일 및  폴더를 삭제하고 싶을 때

* 원격 저장소와 로컬저장소에 있는 파일을 삭제하고 싶을 때

  `git rm - rf <filename>`

* 원격 저장소에 있는 파일만 삭제하고 로컬 저장소 파일은 삭제하고 싶지 않을 때

  `git rm --cached -rf <폴더경로>`

  ​