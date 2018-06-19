class Idea < ApplicationRecord
  belongs_to :topic
  has_many :comments, as: :commentable 
end
