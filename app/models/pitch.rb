class Pitch < ApplicationRecord
  belongs_to :institution
  has_many :schedules
  has_many :reservations

  def price_in_cents
    (self.normal_price*100).to_i
  end

end
