class Pitch < ApplicationRecord
  belongs_to :institution
  has_many :schedules
end
