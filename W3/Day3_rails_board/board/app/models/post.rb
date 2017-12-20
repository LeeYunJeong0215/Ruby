class Post < ActiveRecord::Base
  #댓글 '들'을 가지고 있다.
  has_many :comments #has_many :반드시 '복수형'
end
