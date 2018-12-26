# frozen_string_literal: true

class Sea < ApplicationRecord
  belongs_to :user

  has_many :random_words_idea, dependent: :destroy
end
