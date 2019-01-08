# frozen_string_literal: true

class MandalIdea < ApplicationRecord
  belongs_to :sea
  belongs_to :simple_mandal
end
