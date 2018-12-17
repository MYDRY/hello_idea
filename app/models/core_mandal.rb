# frozen_string_literal: true

class CoreMandal < ApplicationRecord
  belongs_to :user

  has_many :sub_mandals, as: :mandal
end
