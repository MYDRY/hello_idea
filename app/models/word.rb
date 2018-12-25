# frozen_string_literal: true

class Word < ApplicationRecord
  validates :word, presence: true, uniqueness: true

  has_many :random_words_ideas_of_word1, class_name: 'RandomWordsIdea', foreign_key: 'word1_id'
  has_many :random_words_ideas_of_word2, class_name: 'RandomWordsIdea', foreign_key: 'word2_id'
end
