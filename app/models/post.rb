class Post < ApplicationRecord
  before_validation :set_default_counters

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :increment_post_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_comments(reviewed_post = self)
    Comment.where(post: reviewed_post).order(created_at: :desc).limit(5)
  end

  def increment_post_counter
    author.increment!(:post_counter)
  end

  private

  def set_default_counters
    self.comments_counter = 0
    self.likes_counter = 0
  end
end
