class User < ApplicationRecord
  before_validation :set_default_counters
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true }
  validates :post_counter, comparison: { greater_than_or_equal_to: 0 }

  def last_posts(user = self)
    Post.where(author: user).order(created_at: :desc).limit(3)
  end

  private

  def set_default_counters
    self.post_counter = 0
  end
end
