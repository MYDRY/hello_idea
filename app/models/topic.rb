class Topic < ApplicationRecord

  validates :title, {presence: true}
  validates :body, {presence: true, length: {maximum: 140}}
 
  belongs_to :genre
  belongs_to :user
  has_many   :ideas, dependent: :destroy
end
