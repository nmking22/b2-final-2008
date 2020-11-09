require 'rails_helper'

describe Patient, type: :model do
  describe "relationships" do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class_methods' do
    it '#oldest_to_youngest' do
      patient_1 = Patient.create!(
        name: "Katie Bryce",
        age: 24
      )
      patient_2 = Patient.create!(
        name: "Denny Duquette",
        age: 39
      )
      patient_3 = Patient.create!(
        name: "Rebecca Pope",
        age: 32
      )
      patient_4 = Patient.create!(
        name: "Zola Shepherd",
        age: 2
      )

      expected = [patient_2, patient_3, patient_1, patient_4]

      expect(Patient.oldest_to_youngest).to eq(expected)
    end
  end

  describe 'instance_methods' do
    it '#find_doctor_patient' do
      grey_sloan = Hospital.create!(
        name: "Grey Sloan Memorial Hospital"
      )
      dr_grey = Doctor.create!(
        name: "Meredith Grey",
        specialty: "General Surgery",
        university: "Harvard University",
        hospital: grey_sloan
      )
      dr_karev = Doctor.create!(
        name: "Alex Karev",
        specialty: "Pediatric Surgery",
        university: "Harvard University",
        hospital: grey_sloan
      )
      dr_bailey = Doctor.create!(
        name: "Miranda Bailey",
        specialty: "General Surgery",
        university: "Stanford University",
        hospital: grey_sloan
      )
      dr_mcdreamy = Doctor.create!(
        name: "Derek McDreamy",
        specialty: "Attending Surgeon",
        university: "University of Pennsylvania",
        hospital: grey_sloan
      )
      patient_1 = Patient.create!(
        name: "Katie Bryce",
        age: 24
      )
      doctor_patient_1 = DoctorPatient.create!(
        doctor: dr_grey,
        patient: patient_1
      )
      doctor_patient_2 = DoctorPatient.create!(
        doctor: dr_karev,
        patient: patient_1
      )
      doctor_patient_3 = DoctorPatient.create!(
        doctor: dr_bailey,
        patient: patient_1
      )
      doctor_patient_4 = DoctorPatient.create!(
        doctor: dr_mcdreamy,
        patient: patient_1
      )

      expect(patient_1.find_doctor_patient(dr_grey)).to eq(doctor_patient_1)
    end
  end
end
