class Attire < ApplicationRecord
  belongs_to :user
  has_many :destinations
end
