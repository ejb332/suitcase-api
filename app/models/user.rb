class User < ApplicationRecord
  #rails converts passwords into digests via encryption
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }

  has_many :destinations
  has_many :attires
end
