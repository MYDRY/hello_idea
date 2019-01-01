# frozen_string_literal: true

class Invest < ApplicationRecord
  belongs_to :topic
  belongs_to :user
end
