class Moderator < ApplicationRecord
  has_secure_password

  has_many :posts

  validates :fullname, :username, :password, presence: true
end
