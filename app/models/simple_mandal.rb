# frozen_string_literal: true

class SimpleMandal < ApplicationRecord
  belongs_to :user

  has_many :mandal_ideas, dependent: :destroy
end
