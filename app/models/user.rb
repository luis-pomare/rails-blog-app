class User < ApplicationRecord
  has_many :coments
  has_many :likes
  has_many :posts

  def last_posts(user = self)
    Post.where(author: user).order(created_at: :desc).limit(3)
  end
end
