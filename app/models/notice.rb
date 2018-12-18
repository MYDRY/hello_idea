# frozen_string_literal: true

class Notice < ApplicationRecord
  belongs_to :user

  def mark_as_read
    self.has_read = true
  end
end
