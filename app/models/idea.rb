class Idea < ApplicationRecord
  belongs_to :topic
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
end
