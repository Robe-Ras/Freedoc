class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  belongs_to :city
  belongs_to :specialty
end
