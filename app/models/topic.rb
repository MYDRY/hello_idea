class Topic < ApplicationRecord
  belongs_to :genre
  belongs_to :user
  has_many   :ideas
end
