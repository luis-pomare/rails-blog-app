class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  def last_posts(user = self)
    Post.where(author: user).order(created_at: :desc).limit(3)
  end
end
