# frozen_string_literal: true

class Word < ApplicationRecord
  validates :word, presence: true, uniqueness: true
end
