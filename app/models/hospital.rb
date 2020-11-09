class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def unique_universities
    doctors.select(:university).distinct.pluck(:university)
  end
end
