class Question < ActiveRecord::Base
  belongs_to :list
  has_many :likes, class_name: 'Like::Like', as: :likeable
  validates :title, presence: true

  scope :order_by_likes, lambda {
    joins("LEFT OUTER JOIN like_likes ON like_likes.likeable_id = questions.id AND like_likes.likeable_type = 'Question'").group("questions.id").order("COUNT(DISTINCT like_likes.id) DESC")
  }
end
