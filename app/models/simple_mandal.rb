# frozen_string_literal: true

class SimpleMandal < ApplicationRecord
  belongs_to :user

  has_many :random_words_ideas, dependent: :destroy
end
