class Institution < ApplicationRecord
	has_many :pitches
	has_many :contacts
	has_many :reservations
end
