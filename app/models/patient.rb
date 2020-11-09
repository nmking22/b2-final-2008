class Patient < ApplicationRecord
  has_many :doctor_patients
  has_many :doctors, through: :doctor_patients

  def find_doctor_patient(doctor)
    doctor_patients.where(doctor: doctor).first
  end

  def self.oldest_to_youngest
    Patient.order(age: :desc)
  end
end
