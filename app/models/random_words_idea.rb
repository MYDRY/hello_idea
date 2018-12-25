class RandomWordsIdea < ApplicationRecord
  belongs_to :sea
  belongs_to :word1, class_name: 'Word'
  belongs_to :word2, class_name: 'Word'
end
