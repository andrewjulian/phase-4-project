class Comment < ApplicationRecord

  belongs_to :question

  validates :response, presence: true
  
end
