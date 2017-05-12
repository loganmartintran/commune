class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :sponsored_posts

  validates :name, length: {minimum: 5}, presence: true
  validates :description, length: {minimum: 15}, presence: true
end
