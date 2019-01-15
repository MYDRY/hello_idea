# frozen_string_literal: true

class Sea < ApplicationRecord
  belongs_to :user

  has_many :random_words_ideas, dependent: :destroy
  has_many :mandal_ideas, dependent: :destroy
  has_many :likes, as: :likable
  
  validates :body, presence: true
end
