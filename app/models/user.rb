class User < ApplicationRecord

  has_secure_password

  validates :name, {presence: true, uniqueness: true}
  validates :email, {presence: true, uniqueness: true}

  has_many :ideas,  dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :likes,  dependent: :destroy

  mount_uploader :image, ProfileImageUploader
end
