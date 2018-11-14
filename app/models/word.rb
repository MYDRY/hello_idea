class Word < ApplicationRecord
  validates :word, {presence: true, uniqueness: true}
end
