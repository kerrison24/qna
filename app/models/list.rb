class List < ActiveRecord::Base
  has_many :questions
  validates :title, :description, presence: true
end
