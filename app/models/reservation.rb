class Reservation < ApplicationRecord
  belongs_to :institution
  belongs_to :pitch
  belongs_to :user
end
