# frozen_string_literal: true

class SubMandal < ApplicationRecord
  belongs_to :mandal, polymorphic: true

  has_many :sub_mandals, as: :mandal
end
