class List < ActiveRecord::Base
  belongs_to :users
  has_many :questions
  validates :title, :description, presence: true
end
