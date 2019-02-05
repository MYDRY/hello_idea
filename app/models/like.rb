# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :likable, polymorphic: true

  validates :user, uniqueness: { scope: %i[likable_id likable_type] }
end
