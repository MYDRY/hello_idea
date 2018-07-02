class Idea < ApplicationRecord

  validates :title, {presence: true}
  validates :body, {presence: true, length: {maximum: 140}}
  
  belongs_to :topic
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :likes, dependent: :destroy
end
