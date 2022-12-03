class Question < ApplicationRecord

  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :details, presence: true
  
end
