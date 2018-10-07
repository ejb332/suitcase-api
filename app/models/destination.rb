class Destination < ApplicationRecord
  belongs_to :user
  validates :city, :country, :start_date, :end_date, presence: true

  def us_friendly_start_date
    start_date.strftime("%A, %b %d %Y")
  end

  def us_friendly_end_date
    end_date.strftime("%A, %b %d %Y")
  end

  def friendly_start_date
    start_date.strftime("%A, %d %b %Y")
  end

  def friendly_end_date
    end_date.strftime("%A, %d %b %Y")
  end
end
