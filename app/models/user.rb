# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true
  # validates :email, {presence: true, uniqueness: true}
  validates :password,
    confirmation: true,
    presence:     { message: 'を入力してください' },
    allow_nil:    true

  has_many :ideas,  dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :likes,  dependent: :destroy
  has_many :notices, dependent: :destroy
  has_many :core_mandals, dependent: :destroy
  has_many :simple_mandals, dependent: :destroy
  has_many :seas,  dependent: :destroy
  has_many :invests, dependent: :destroy

  mount_uploader :image, ProfileImageUploader

  def change_point(amount)
    self.point += amount
    self.point = 0 if self.point.negative?
    save!
  end
end
