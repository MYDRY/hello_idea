# frozen_string_literal: true

class Topic < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 140 }

  belongs_to :genre
  belongs_to :user

  has_many   :ideas, dependent: :destroy
  has_many :invests, dependent: :destroy
  
  def get_supported(support_amount)
    self.support += support_amount
    save!
  end
end
