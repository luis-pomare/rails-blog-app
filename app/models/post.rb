class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :coments
  has_many :likes
  after_save :increment_post_counter

  def last_comments(reviewed_post = self)
    Comment.where(post: reviewed_post).order(created_at: :desc).limit(5)
  end

  def increment_post_counter
    author.increment!(:post_counter)
  end
end
