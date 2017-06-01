class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  default_scope { order('created_at DESC') }
  scope :ordered_by_title, -> { order('title') }
  scope :ordered_by_reverse_created_at, -> { order('created_at').reverse_order }

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true
  validates :user, presence: true

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end
end
