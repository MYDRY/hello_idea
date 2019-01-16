# frozen_string_literal: true

class Idea < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }

  belongs_to :topic
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :likes, as: :likable, dependent: :destroy
end
